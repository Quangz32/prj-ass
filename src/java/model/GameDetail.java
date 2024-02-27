
package model;


public class GameDetail {
    int gameId;
    String introduction;
    String description;

    public GameDetail(int gameId, String introduction, String description) {
        this.gameId = gameId;
        this.introduction = introduction;
        this.description = description;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "GameDetail{" + "gameId=" + gameId + ", introduction=" + introduction + ", description=" + description + '}';
    }
    
    
}
