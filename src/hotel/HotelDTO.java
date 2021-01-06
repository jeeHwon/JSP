package hotel;

public class HotelDTO {
	private int id, max_in, min_in, price;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMax_in() {
		return max_in;
	}
	public void setMax_in(int max_in) {
		this.max_in = max_in;
	}
	public int getMin_in() {
		return min_in;
	}
	public void setMin_in(int min_in) {
		this.min_in = min_in;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
