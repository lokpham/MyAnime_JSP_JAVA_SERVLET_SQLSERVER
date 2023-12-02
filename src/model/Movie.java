package model;

public class Movie {
	int sotapphim;
	String ten;
	int theloai_thoiluong;
	int thoiluong;
	float danhgia;
	String id;
	String thump;
	String year;
	String description;
	String othername;
	
	public Movie(int sotapphim, String ten, int theloai_thoiluong, int thoiluong, float danhgia, String id,
			String thump, String year) {
		super();
		this.sotapphim = sotapphim;
		this.ten = ten;
		this.theloai_thoiluong = theloai_thoiluong;
		this.thoiluong = thoiluong;
		this.danhgia = danhgia;
		this.id = id;
		this.thump = thump;
		this.year = year;
	}
	
	public Movie(int sotapphim, String ten, int theloai_thoiluong, int thoiluong, float danhgia, String id,
			String thump, String year, String description, String othername) {
		super();
		this.sotapphim = sotapphim;
		this.ten = ten;
		this.theloai_thoiluong = theloai_thoiluong;
		this.thoiluong = thoiluong;
		this.danhgia = danhgia;
		this.id = id;
		this.thump = thump;
		this.year = year;
		this.description = description;
		this.othername = othername;
	}

	public int getSotapphim() {
		return sotapphim;
	}
	public void setSotapphim(int sotapphim) {
		this.sotapphim = sotapphim;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public int getTheloai_thoiluong() {
		return theloai_thoiluong;
	}
	public void setTheloai_thoiluong(int theloai_thoiluong) {
		this.theloai_thoiluong = theloai_thoiluong;
	}
	public int getThoiluong() {
		return thoiluong;
	}
	public void setThoiluong(int thoiluong) {
		this.thoiluong = thoiluong;
	}
	public float getDanhgia() {
		return danhgia;
	}
	public void setDanhgia(float danhgia) {
		this.danhgia = danhgia;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getThump() {
		return thump;
	}
	public void setThump(String thump) {
		this.thump = thump;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	
	
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOthername() {
		return othername;
	}

	public void setOthername(String othername) {
		this.othername = othername;
	}

	@Override
	public String toString() {
		return "Movie [sotapphim=" + sotapphim + ", ten=" + ten + ", theloai_thoiluong=" + theloai_thoiluong
				+ ", thoiluong=" + thoiluong + ", danhgia=" + danhgia + ", id=" + id + ", thump=" + thump + ", year="
				+ year + "]";
	}
	
	
}
