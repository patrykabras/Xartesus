package com.patal.logicdbstruct;

import com.patal.dbstruct.User;

import java.util.List;
import java.util.stream.Collectors;

public class UsersList {

    private  List<User> usersList;

    public UsersList(List<User> usersList) {
        this.usersList = usersList;
    }

    public List<User> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<User> usersList) {
        this.usersList = usersList;
    }

    public List<User> searchByUsername(String phrase){
        return usersList.stream().filter(user -> phrase.equals(user.getLogin())).collect(Collectors.toList());
    }
    public List<User> searchByMail(String phrase){
        return usersList.stream().filter(user -> phrase.equals(user.getMail())).collect(Collectors.toList());
    }
}
