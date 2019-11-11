package com.patal.dbstruct;

import java.sql.Date;

public class User {
    private int idUser;
    private int usertype;
    private String name;
    private String surname;
    private Date birthDate;
    private String login;
    private String mail;
    private String password;

    public User(int idUser, int usertype, String name, String surname, Date birthDate, String login, String mail, String password) {
        this.idUser = idUser;
        this.usertype = usertype;
        this.name = name;
        this.surname = surname;
        this.birthDate = birthDate;
        this.login = login;
        this.mail = mail;
        this.password = password;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getUsertype() {
        return usertype;
    }

    public void setUsertype(int usertype) {
        this.usertype = usertype;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "idUser=" + idUser +
                ", usertype=" + usertype +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", birthDate=" + birthDate +
                ", login='" + login + '\'' +
                ", mail='" + mail + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}