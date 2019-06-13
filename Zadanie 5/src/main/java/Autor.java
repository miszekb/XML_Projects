public class Autor {
    private String autorDane;
    private short grupa;
    private String github;

    public Autor(String autorDane, short grupa, String github) {
        this.autorDane = autorDane;
        this.grupa = grupa;
        this.github = github;
    }

    public String getAutorDane() {
        return autorDane;
    }

    public void setAutorDane(String autorDane) {
        this.autorDane = autorDane;
    }

    public short getGrupa() {
        return grupa;
    }

    public void setGrupa(short grupa) {
        this.grupa = grupa;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }
}
