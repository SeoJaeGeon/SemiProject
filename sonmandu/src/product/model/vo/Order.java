package product.model.vo;

import java.sql.Date;

public class Order {
	
	private Date pay_date;
	private String change_name;
	private String product_name;
	private int order_quantity;
	private int total_sal;
	
	public Order() {}

	public Order(Date pay_date, String change_name, String product_name, int order_quantity, int total_sal) {
		super();
		this.pay_date = pay_date;
		this.change_name = change_name;
		this.product_name = product_name;
		this.order_quantity = order_quantity;
		this.total_sal = total_sal;
	}


	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

	public int getTotal_sal() {
		return total_sal;
	}

	public void setTotal_sal(int total_sal) {
		this.total_sal = total_sal;
	}

	@Override
	public String toString() {
		return "History [pay_date=" + pay_date + ", change_name=" + change_name + ", product_name=" + product_name
				+ ", order_quantity=" + order_quantity + ", total_sal=" + total_sal + "]";
	}

	
	
	

}