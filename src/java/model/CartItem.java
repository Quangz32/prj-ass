package model;

import database.GameDAO;

public class CartItem {

    int id;
    int userId;
    int gameId;
    int quantity;
    String status;

    public CartItem(int id, int userId, int gameId, int quantity, String status) {
        this.id = id;
        this.userId = userId;
        this.gameId = gameId;
        this.quantity = quantity;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CartItem{" + "id=" + id + ", userId=" + userId + ", gameId=" + gameId + ", quantity=" + quantity + ", status=" + status + '}';
    }

    // GET GAME MODEL
    public Game getGame() {
        GameDAO gDAO = new GameDAO();
        return gDAO.getById(this.gameId);
    }

}
