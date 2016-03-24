package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bus")
public class Bus {
	//Õ¾µã±êºÅ
	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false,unique=true)
	private String name;

	@ManyToOne(targetEntity = Company.class)
	@JoinColumn(name = "companyId",nullable=false)
	private Company company;
	
	private Integer isCircle;
	
	private Integer isCross;
	
	private Integer numStation;
	
	private double length;
	
	private Integer time;
	@Column(nullable=false,unique=true)
	@Lob
	private String lenTo;
	@Column(nullable=false,unique=true)
	@Lob
	private String idTo;
	@Column(nullable=false,unique=true)
	@Lob
	private String endTimeTo;
	@Column(nullable=false,unique=true)
	@Lob
	private String startTimeTo;
	@Column(nullable=false,unique=true)
	@Lob
	private String lenFrom;
	@Column(nullable=false,unique=true)
	@Lob
	private String idFrom;
	@Column(nullable=false,unique=true)
	@Lob
	private String endTimeFrom;
	@Column(nullable=false,unique=true)
	@Lob
	private String startTimeFrom;
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getStartTimeTo() {
		return startTimeTo;
	}

	public void setStartTimeTo(String startTimeTo) {
		this.startTimeTo = startTimeTo;
	}

	public String getStartTimeFrom() {
		return startTimeFrom;
	}

	public void setStartTimeFrom(String startTimeFrom) {
		this.startTimeFrom = startTimeFrom;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getIsCircle() {
		return isCircle;
	}

	public void setIsCircle(Integer isCircle) {
		this.isCircle = isCircle;
	}

	public Integer getIsCross() {
		return isCross;
	}

	public void setIsCross(Integer isCross) {
		this.isCross = isCross;
	}

	public Integer getNumStation() {
		return numStation;
	}

	public void setNumStation(Integer numStation) {
		this.numStation = numStation;
	}

	public double getLength() {
		return length;
	}

	public void setLength(double length) {
		this.length = length;
	}

	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public String getLenTo() {
		return lenTo;
	}

	public void setLenTo(String lenTo) {
		this.lenTo = lenTo;
	}

	public String getIdTo() {
		return idTo;
	}

	public void setIdTo(String idTo) {
		this.idTo = idTo;
	}

	public String getEndTimeTo() {
		return endTimeTo;
	}

	public void setEndTimeTo(String endTimeTo) {
		this.endTimeTo = endTimeTo;
	}

	public String getLenFrom() {
		return lenFrom;
	}

	public void setLenFrom(String lenFrom) {
		this.lenFrom = lenFrom;
	}

	public String getIdFrom() {
		return idFrom;
	}

	public void setIdFrom(String idFrom) {
		this.idFrom = idFrom;
	}

	public String getEndTimeFrom() {
		return endTimeFrom;
	}

	public void setEndTimeFrom(String endTimeFrom) {
		this.endTimeFrom = endTimeFrom;
	}
	
}

