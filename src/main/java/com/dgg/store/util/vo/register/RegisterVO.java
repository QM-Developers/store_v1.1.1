package com.dgg.store.util.vo.register;

public class RegisterVO
{
    private String userId;

    private String userPhone;

    private String userPassword;

    private String myTeamId;

    private String verify;

    private String cardFront;

    private String cardBack;

    private String cardHand;

    private String cardId;

    private String userStatus;

    private String token;

    public String getUserStatus()
    {
        return userStatus;
    }

    public void setUserStatus(String userStatus)
    {
        this.userStatus = userStatus;
    }

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserPhone()
    {
        return userPhone;
    }

    public void setUserPhone(String userPhone)
    {
        this.userPhone = userPhone;
    }

    public String getUserPassword()
    {
        return userPassword;
    }

    public void setUserPassword(String userPassword)
    {
        this.userPassword = userPassword;
    }

    public String getMyTeamId()
    {
        return myTeamId;
    }

    public void setMyTeamId(String myTeamId)
    {
        this.myTeamId = myTeamId;
    }

    public String getVerify()
    {
        return verify;
    }

    public void setVerify(String verify)
    {
        this.verify = verify;
    }

    public String getCardFront()
    {
        return cardFront;
    }

    public void setCardFront(String cardFront)
    {
        this.cardFront = cardFront;
    }

    public String getCardBack()
    {
        return cardBack;
    }

    public void setCardBack(String cardBack)
    {
        this.cardBack = cardBack;
    }

    public String getCardHand()
    {
        return cardHand;
    }

    public void setCardHand(String cardHand)
    {
        this.cardHand = cardHand;
    }

    public String getCardId()
    {
        return cardId;
    }

    public void setCardId(String cardId)
    {
        this.cardId = cardId;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }
}
