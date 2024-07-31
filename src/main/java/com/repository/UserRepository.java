package com.repository;

import com.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.model.Spending;
import com.model.User;

public class UserRepository extends DBUtil {

    public User check(String username, String password) {
        String sql = "SELECT * FROM Users WHERE userName = ? and password = ? and [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int checkAccountAdmin(String userName) {
        String sql = "select  from Users where [userName]=? and [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users WHERE [status] = 1 order by roleId asc";
        try(Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean checkUserNameDuplicate(String username) {
        String sql = "SELECT * FROM Users WHERE userName = ? and [status] = 1";
        try(Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID"));
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void updateImage(String image, String userName) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET \n"
                + "      [Image] = ?\n"
                + " WHERE userName = ? and [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, image);
            preparedStatement.setString(2, userName);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String name, String address, String phone, String email, String dob, String userName) {
        String sql = "UPDATE [dbo].[Users] SET \n";
        if (name != null) {
            sql += " [fullName] = " + "?";
        }
        if (address != null) {
            sql += ", [address] =" + "?";
        }
        sql += ", [phone] =" + "?";
        sql += ", [email] =" + "?";
        sql += ", [BirthDay] =" + "?";
        sql += " WHERE userName = ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, address);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, dob);
            preparedStatement.setString(6, userName);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserByUserName(String userName) {
        String sql = "SELECT * FROM [dbo].[Users] where UserName=? and [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            //set ?
            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            //1
            if (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    // 
   public int getNumberUsers() {
       String sql = "SELECT COUNT(*) FROM Users"; 
	   try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (Exception e) {
        }
        return 1;
    }

    public void insert(User c) {
        String sql = "INSERT INTO [dbo].[Users]\n" +
"           ([UserName]\n" +
"           ,[FullName]\n" +
"           ,[Password]\n" +
"           ,[RoleID]\n" +
"           ,[Image]\n" +
"           ,[Email]\n" +
"           ,[BirthDay]\n" +
"           ,[Address]\n" +
"           ,[Phone]\n" +
"           ,[status])\n" +
"     VALUES (?,?,?,?,?,?,?,?,?,?)";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, c.getUserName());
            preparedStatement.setString(2, c.getFullName());
            preparedStatement.setString(3, c.getPassword());
            preparedStatement.setInt(4, c.getRoleID());
            preparedStatement.setString(5, "images/users/user.png");
            preparedStatement.setString(6, c.getEmail());
            preparedStatement.setString(7, c.getBirthdate());
            preparedStatement.setString(8, "No information");
            preparedStatement.setString(9, c.getPhone());
            preparedStatement.setInt(10, 1);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int countAllUser() {
        String sql = "select count(*) from Users where [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void insertUser(String UserName, String FullName, String Password,
            int RoleID, String Email, String BirthDay, String Phone) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([UserName]\n"
                + "           ,[FullName]\n"
                + "           ,[Password]\n"
                + "           ,[Image]\n"
                + "           ,[RoleID]\n"
                + "           ,[Email]\n"
                + "           ,[BirthDay]\n"
                + "           ,[Phone]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, UserName);
            preparedStatement.setString(2, FullName);
            preparedStatement.setString(3, Password);
            preparedStatement.setString(4, "images/users/user.png");
            preparedStatement.setInt(5, RoleID);
            preparedStatement.setString(6, Email);
            preparedStatement.setString(7, BirthDay);
            preparedStatement.setString(8, Phone);
            preparedStatement.setInt(9, 1);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteUser(String username) {
        String sql = "update Users set status = 0 where UserName= ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        UserRepository p = new UserRepository();
        p.insertUser("duc", "thanh", "123",
             2, "thanh@gmail.com", "2003-09-08", "4012412341");
        List<User> list = p.getAllUsers();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getFullName());
        }
    }

    public List<Spending> getTop5Customers() {
        List<Spending> list = new ArrayList<>();
        String sql = "select top(5) u.*, sum(TotalMoney) as TotalMoney from Orders o inner join Users u on o.UserName = u.UserName and u.status = 1 group by u.Address, "
                + "u.BirthDay, u.Email, u.FullName, u.UserName, u.Password, u.Image, u.RoleID, u.UserID, u.Phone, u.status\n" + " order by TotalMoney desc";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"),
                        rs.getString("BirthDay"), rs.getInt("roleID"));
                list.add(new Spending(user, rs.getDouble("TotalMoney")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<User> getUsersBySearchName(String txtSearch) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Users] where UserName LIKE ? and [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            //set ?
            preparedStatement.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void changePassword(User s) {
        String sql = "Update Users set password = ? where username = ? and [status] = 1";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, s.getPassword());
            preparedStatement.setString(2, s.getUserName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public String checkEmailExist(String email) {
        String sql = "SELECT * FROM Users WHERE Email = ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return email;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    // 
    public String getUserNameByEmail(String email) {
        String sql = "SELECT Top 1 UserName FROM [dbo].[Users] WHERE Email = ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            //set ?
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //
    public void updatePassByUserName(String pass, String username) {
        String sql = "update Users set Password = ? where UserName= ?";
        try(Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, pass);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

}
