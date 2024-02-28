package model;

public class CartItem {

    int userId;
    int gameId;
    int quantity;

    public CartItem(int userId, int gameId, int quantity) {
        this.userId = userId;
        this.gameId = gameId;
        this.quantity = quantity;
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

    @Override
    public String toString() {
        return "CartItem{" + "userId=" + userId + ", gameId=" + gameId + ", quantity=" + quantity + '}';
    }

}
