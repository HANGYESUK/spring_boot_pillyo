package com.pillyo.pill.model;

public class DrugShapeAPIVO {
	private String itemName;
	private String entpName;
	private String itemSeq;	// 품목번호
	private String chart;		// 성상
	private String itemImage;
	private String print_front;	// 표기
	private String drug_shape;	// 모양
	private String color_class;	// 색상
	private String class_name;	// 해열,진통,소염제..
	private String form_code_name;
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getEntpName() {
		return entpName;
	}
	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public String getChart() {
		return chart;
	}
	public void setChart(String chart) {
		this.chart = chart;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public String getPrint_front() {
		return print_front;
	}
	public void setPrint_front(String print_front) {
		this.print_front = print_front;
	}
	public String getDrug_shape() {
		return drug_shape;
	}
	public void setDrug_shape(String drug_shape) {
		this.drug_shape = drug_shape;
	}
	public String getColor_class() {
		return color_class;
	}
	public void setColor_class(String color_class) {
		this.color_class = color_class;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getForm_code_name() {
		return form_code_name;
	}
	public void setForm_code_name(String form_code_name) {
		this.form_code_name = form_code_name;
	}	
	
	
}
