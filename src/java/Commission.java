/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class Commission {

    private int totalLocks, totalStocks, totalBarrales;
    private double lockPrice, stockPrice, barralesPrice, lockSales, stockSales, barraelSale, Sales, Commission;

    public Commission(int totalLocks, int totalStocks, int totalBarrales, double lockPrice, double stockPrice, double barralesPrice) {
        this.totalLocks = totalLocks;
        this.totalStocks = totalStocks;
        this.totalBarrales = totalBarrales;
        this.lockPrice = lockPrice;
        this.stockPrice = stockPrice;
        this.barralesPrice = barralesPrice;
    }

    public double calSale() {
        lockSales = lockPrice * totalLocks;
        stockSales = stockPrice * totalStocks;
        barraelSale = barralesPrice * totalBarrales;

        Sales = lockSales + stockSales + barraelSale;

        return Sales;
    }

    public int getTotalLocks() {
        return totalLocks;
    }

    public int getTotalStocks() {
        return totalStocks;
    }

    public int getTotalBarrales() {
        return totalBarrales;
    }

    public double getLockPrice() {
        return lockPrice;
    }

    public void setTotalLocks(int totalLocks) {
        this.totalLocks = totalLocks;
    }

    public void setTotalStocks(int totalStocks) {
        this.totalStocks = totalStocks;
    }

    public void setTotalBarrales(int totalBarrales) {
        this.totalBarrales = totalBarrales;
    }

    public void setLockPrice(double lockPrice) {
        this.lockPrice = 30.0;
    }

    public void setStockPrice(double stockPrice) {
        this.stockPrice = 35.0;
    }

    public void setBarralesPrice(double barralesPrice) {
        this.barralesPrice = 40.0;
    }

    public void setLockSales(double lockSales) {
        this.lockSales = lockSales;
    }

    public void setStockSales(double stockSales) {
        this.stockSales = stockSales;
    }

    public void setBarraelSale(double barraelSale) {
        this.barraelSale = barraelSale;
    }

    public void setSales(double Sales) {
        this.Sales = Sales;
    }

    public void setCommission(double Commission) {
        this.Commission = Commission;
    }

    public double getStockPrice() {
        return stockPrice;
    }

    public double getBarralesPrice() {
        return barralesPrice;
    }

    public double getLockSales() {
        return lockSales;
    }

    public double getStockSales() {
        return stockSales;
    }

    public double getBarraelSale() {
        return barraelSale;
    }

    public double getSales() {
        return Sales;
    }

    public double getCommission() {
        return Commission;
    }

}
