package com.repository;

import com.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.model.User;
import com.model.Wallet;

public class WalletRepository extends DBUtil {

    //
    public int getNumberWallets() {
        String sql = "SELECT COUNT(*) FROM Wallets";
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
    //
    public void addWallet(Wallet wallet) {
    	  String sql = "INSERT INTO [dbo].[Wallets]\n"
                  + "           ([UserName]\n"
                  + "           ,[Balance])\n"
                  + "     VALUES (?, ?)";
    	  try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
          
            preparedStatement.setString(1, wallet.getUserName());
            preparedStatement.setDouble(2, wallet.getBalance());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Wallet> getWalletBySearchName(String txtSearch) {
        List<Wallet> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Wallets] where UserName LIKE ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            //set ?
            preparedStatement.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new Wallet(rs.getString("UserName"), rs.getDouble("Balance")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    // 
    public Wallet getWalletByUserName(String name) {
        String sql = "SELECT * FROM Wallets WHERE UserName = ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, name);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                int id = rs.getInt(1);
                String userName = rs.getString(2);
                double balance = rs.getDouble(3);
                Wallet w = new Wallet(userName, balance);
                return w;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    // 
    public void inputMoney(String userName, double value) {
        String sql = "UPDATE [dbo].[Wallets] SET [Balance] = (Balance + ?) WHERE UserName = ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setDouble(1, value);
            preparedStatement.setString(2, userName);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // 
    public void decuctionMoney(String userName, double value ){
    	  String sql = "UPDATE [dbo].[Wallets] SET [Balance] = (Balance - ?) WHERE UserName = ?";
    	  try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setDouble(1, value);
            preparedStatement.setString(2, userName);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<Wallet> getAll() {
        List<Wallet> list = new ArrayList<>();
        String sql = "select * from Wallets order by Balance desc";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new Wallet(rs.getString("UserName"), rs.getDouble("Balance")));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
