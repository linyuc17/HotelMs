package cn.edu.mju.band2.po;

public class Json {
    private String name;
    private String password;
    private String vertity;

    public Json() {
    }

    public Json(String name, String password, String vertity) {
        this.name = name;
        this.password = password;
        this.vertity = vertity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVertity() {
        return vertity;
    }

    public void setVertity(String vertity) {
        this.vertity = vertity;
    }

    @Override
    public String toString() {
        return "Json{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", vertity='" + vertity + '\'' +
                '}';
    }
}
