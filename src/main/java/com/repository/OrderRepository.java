package com.repository;

import com.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.model.Cart;
import com.model.Item;
import com.model.Order;
import com.model.User;


public class OrderRepository {

    //
    public int getNumberOrders() {
        String sql = "SELECT COUNT(*) FROM Orders";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (Exception e) {
        }
        return 1;
    }

    public void addOrder(User cus, Cart cart) {
    	  // add vao bang Order
        String sql1 = "INSERT INTO [dbo].[Orders]\n"
                + "           ([Date]\n"
                + "           ,[UserName]\n"
                + "           ,[TotalMoney]\n"
                + "           ,[status])\n"
                + "     VALUES (?,?,?,?)";
        ProductRepository pd = new ProductRepository();
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql1)){
        	preparedStatement.setString(1, date);
        	preparedStatement.setString(2, cus.getUserName());
        	preparedStatement.setDouble(3, cart.getTotalMoney());
        	preparedStatement.setInt(4, 0);
        	preparedStatement.executeUpdate();

            // Lay ra orderID cua Order vua tao
            String sql2 = "SELECT Top 1 [OrderID] FROM [dbo].[Orders] ORDER BY [OrderID] DESC";
            PreparedStatement preparedStatement2 = connection.prepareStatement(sql2);
            ResultSet rs = preparedStatement2.executeQuery();

            // add thong tin vao bang OrderDetails
            if (rs.next()) {
                int oID = rs.getInt(1);
                for (Item item : cart.getListItems()) {
                    String sql3 = "INSERT INTO [dbo].[OrderDetails]\n"
                            + "           ([OrderID]\n"
                            + "           ,[ProductID]\n"
                            + "           ,[Quantity]\n"
                            + "           ,[UnitPrice]\n"
                            + "           ,[Discount])\n"
                            + "     VALUES (?,?,?,?,?)";
                    PreparedStatement preparedStatement3 = connection.prepareStatement(sql3);
                    preparedStatement3.setInt(1, oID);
                    preparedStatement3.setInt(2, item.getProduct().getId());
                    preparedStatement3.setInt(3, item.getQuantity());
                    preparedStatement3.setDouble(4, item.getProduct().getPrice());
                    preparedStatement3.setDouble(5, item.getProduct().getDiscount());
                    preparedStatement3.executeUpdate();
                    // update quantiy sp
                    pd.updateValueProduct(item.getProduct(), item.getProduct().getId());
                }
            }

            // add vao bang orderDetail
        } catch (Exception e) {
        }
    }

    public double totalMoneyMonth(int month, int year) {
        String sql = "select SUM([TotalMoney]) from [Orders]\r\n"
                + "where MONTH([Date])=? and year([Date])=?";
        try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
         
        	preparedStatement.setInt(1, month);
        	preparedStatement.setInt(2, year);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyWeek(int day, int from, int to, int year, int month) {
        String sql = "";
        if (from > to) {
            sql = " SELECT SUM(TotalMoney)\n"
                    + "				FROM Orders\n"
                    + "				WHERE ((DAY([Date]) >= ? AND MONTH([Date]) = ?) OR (DAY([Date]) <= ? AND MONTH([Date]) = ?)) AND YEAR([Date]) = ? and DATEPART(dw,[Date]) = ?";
        } else {
            sql = "select \n"
                    + "               	SUM(TotalMoney)\n"
                    + "                  from Orders\n"
                    + "               where day([Date]) between ? and ? and month([Date]) = ? and year([Date])= ?  and DATEPART(dw,[Date]) = ?";
        }
        try  (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            if (from > to) {
            	preparedStatement.setInt(1, from);
            	preparedStatement.setInt(2, month);
            	preparedStatement.setInt(3, to);
            	preparedStatement.setInt(4, (month + 1));
            	preparedStatement.setInt(5, year);
            	preparedStatement.setInt(6, day);
            } else {
            	preparedStatement.setInt(1, from);
            	preparedStatement.setInt(2, to);
            	preparedStatement.setInt(3, month);
            	preparedStatement.setInt(4, year);
            	preparedStatement.setInt(5, day);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double sumAllMoneyOrder() {
        String sql = "select SUM([TotalMoney]) from Orders";
        try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from Orders order by status asc";
        try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getDate(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getBoolean(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderRepository dao = new OrderRepository();
        double a = dao.totalMoneyWeek(6, 27, 3, 2023, 11);
        System.out.println(a);
    }

    public void updateStatus(int id) {
        List<Order> list = new ArrayList<>();
        String sql = "UPDATE [dbo].[Orders] SET [status] = 1 WHERE [OrderID] = ?";
        try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        	preparedStatement.setInt(1, id);
        	preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }
}
