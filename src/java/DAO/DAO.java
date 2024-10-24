/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author PC
 */

import java.sql.*;

public class DAO {
    
    private Connection connection;

    public DAO() throws Exception{
        String url ="jdbc:sqlserver://" + serverName + ":" + portNumber + ":" + "\\" + instance + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true";
        if(instance == null || instance.trim().isEmpty()){
            url =  "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true;characterEncoding=UTF-8";
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        this.connection = DriverManager.getConnection(url, userID, password);
    }
    
    public Connection getConnection(){
        return this.connection;
    }
    
//    public Connection getConnection() throws Exception {
//        String url ="jdbc:sqlserver://" + serverName + ":" + portNumber + ":" + "\\" + instance + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true";
//        if(instance == null || instance.trim().isEmpty()){
//            url =  "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=true;trustServerCertificate=true;characterEncoding=UTF-8";
//        }
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        return DriverManager.getConnection(url, userID, password);
//    }
    
    
    private final String serverName = "HOSA\\SERVER";
    private final String dbName = "LibMan";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "123";
} 
