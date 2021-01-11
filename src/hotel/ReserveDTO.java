package hotel;

public class ReserveDTO {
	private int id, rid, inwon1, inwon2, inwon3, opt1, opt2, opt3, suk_price, etc_price, tot_price;
	private String name, phone, inday, outday, writeday;
	private int suk;	//테이블에 없는 필드
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getInwon1() {
		return inwon1;
	}
	public void setInwon1(int inwon1) {
		this.inwon1 = inwon1;
	}
	public int getInwon2() {
		return inwon2;
	}
	public void setInwon2(int inwon2) {
		this.inwon2 = inwon2;
	}
	public int getInwon3() {
		return inwon3;
	}
	public void setInwon3(int inwon3) {
		this.inwon3 = inwon3;
	}
	public int getOpt1() {
		return opt1;
	}
	public void setOpt1(int opt1) {
		this.opt1 = opt1;
	}
	public int getOpt2() {
		return opt2;
	}
	public void setOpt2(int opt2) {
		this.opt2 = opt2;
	}
	public int getOpt3() {
		return opt3;
	}
	public void setOpt3(int opt3) {
		this.opt3 = opt3;
	}
	public int getSuk_price() {
		return suk_price;
	}
	public void setSuk_price(int suk_price) {
		this.suk_price = suk_price;
	}
	public int getEtc_price() {
		return etc_price;
	}
	public void setEtc_price(int etc_price) {
		this.etc_price = etc_price;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getInday() {
		return inday;
	}
	public void setInday(String inday) {
		this.inday = inday;
	}
	public String getOutday() {
		return outday;
	}
	public void setOutday(String outday) {
		this.outday = outday;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getSuk() {
		return suk;
	}
	public void setSuk(int suk) {
		this.suk = suk;
	}
}
