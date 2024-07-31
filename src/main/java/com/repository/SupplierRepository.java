package com.repository;

import com.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.model.Supplier;

public class SupplierRepository extends DBUtil {

    public List<Supplier> getAll() {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM Suppliers";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getInt("SupplierID"));
                s.setCompanyName(rs.getString("CompanyName"));
                s.setConTactName(rs.getString("ContactName"));
                s.setCountry(rs.getString("Country"));
                s.setPhone(rs.getString("Phone"));
                s.setHomepage(rs.getString("HomePage"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Supplier> getSuppliersBySearch(String txtSearch) {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM Suppliers WHERE CompanyName LIKE ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
        	preparedStatement.setString(1, "%" + txtSearch + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getInt("SupplierID"));
                s.setCompanyName(rs.getString("CompanyName"));
                s.setConTactName(rs.getString("ContactName"));
                s.setCountry(rs.getString("Country"));
                s.setPhone(rs.getString("Phone"));
                s.setHomepage(rs.getString("HomePage"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Supplier getSupplierById(int id) {
        String sql = "SELECT * FROM Suppliers WHERE SupplierID = ?";
        try(Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            //set ?
        	preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            //1
            if (rs.next()) {
                Supplier s = new Supplier();
                s.setId(rs.getInt("SupplierID"));
                s.setCompanyName(rs.getString("CompanyName"));
                s.setConTactName(rs.getString("ContactName"));
                s.setCountry(rs.getString("Country"));
                s.setPhone(rs.getString("Phone"));
                s.setHomepage(rs.getString("HomePage"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Supplier c) {
        String sql = "INSERT INTO [dbo].[Suppliers]\n"
                + "           ([CompanyName]\n"
                + "           ,[ContactName]\n"
                + "           ,[Country]\n"
                + "           ,[Phone]\n"
                + "           ,[HomePage])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){

        	preparedStatement.setString(1, c.getCompanyName());
        	preparedStatement.setString(2, c.getContactName());
        	preparedStatement.setString(3, c.getCountry());
        	preparedStatement.setString(4, c.getPhone());
        	preparedStatement.setString(5, c.getHomepage());
        	preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSupplier(int sid) {
        String sql = "delete from Suppliers where SupplierID = ?";
        try (Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
        	preparedStatement.setInt(1, sid);
        	preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        SupplierRepository p = new SupplierRepository();
        p.deleteSupplier(1);
        List<Supplier> list = p.getAll();

        for (Supplier supplier : list) {
            System.out.println(supplier.getCompanyName());
        }
    }

    public void editSupplier(int id, String companyName, String contactName, String country, String phone, String homepage) {
        String sql = "UPDATE [dbo].[Suppliers]\n"
                + "   SET [CompanyName] = ?\n"
                + "      ,[ContactName] = ?\n"
                + "      ,[Country] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[HomePage] = ?\n"
                + " WHERE [SupplierID] = ?";
        try(Connection connection = DBUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)){
        	preparedStatement.setString(1, companyName);
        	preparedStatement.setString(2, contactName);
        	preparedStatement.setString(3, country);
        	preparedStatement.setString(4, phone);
        	preparedStatement.setString(5, homepage);
        	preparedStatement.setInt(6, id);
        	preparedStatement.executeUpdate();

        } catch (Exception e) {

        }
    }
    
    public int countAllSupplier() {
        String sql = "select count(*) from Suppliers";
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
}
