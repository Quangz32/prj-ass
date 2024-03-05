package model;

import database.UserDAO;

public class Feedback {
    private int id;
    private int userId;
    private int gameId;
    private String content;

    public Feedback(int id, int userId, int gameId, String content) {
        this.id = id;
        this.userId = userId;
        this.gameId = gameId;
        this.content = content;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", userId=" + userId + ", gameId=" + gameId + ", content=" + content + '}';
    }

    ////
    public String getUserName(){
        UserDAO uDAO = new UserDAO();
        User user = uDAO.getById(this.userId);
        return user.getName();
    }
    

    
}
    
