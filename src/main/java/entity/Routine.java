package entity;

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
@Table(name="routine")
public class Routine {
	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable=false,unique=true)
	private Integer pos;
	
	@Column(nullable=false,unique=true)
	private String name;

	@ManyToOne(targetEntity = Company.class)
	@JoinColumn(name = "companyId",nullable=false)
	private Company company;

	@Column(nullable=false)
	private Boolean isCircle;

	@Column(nullable=false)
	private Boolean isCross;

	@Column(nullable=false)
	private Integer numStation;
	
	private double length;
	
	private Integer time;
	
	@Column(nullable=false)
	@Lob
	private String lenTo;
	@Column(nullable=false)
	@Lob
	private String posTo;
	@Column(nullable=false)
	@Lob
	private String endTimeTo;
	@Column(nullable=false)
	@Lob
	private String startTimeTo;
	@Lob
	private String lenFrom;
	@Lob
	private String posFrom;
	@Lob
	private String endTimeFrom;
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

	public Integer getPos() {
		return pos;
	}

	public void setPos(Integer pos) {
		this.pos = pos;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsCircle() {
		return isCircle;
	}

	public void setIsCircle(Boolean isCircle) {
		this.isCircle = isCircle;
	}

	public Boolean getIsCross() {
		return isCross;
	}

	public void setIsCross(Boolean isCross) {
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

	public String getEndTimeFrom() {
		return endTimeFrom;
	}

	public void setEndTimeFrom(String endTimeFrom) {
		this.endTimeFrom = endTimeFrom;
	}

	public String getPosTo() {
		return posTo;
	}

	public void setPosTo(String posTo) {
		this.posTo = posTo;
	}

	public String getPosFrom() {
		return posFrom;
	}

	public void setPosFrom(String posFrom) {
		this.posFrom = posFrom;
	}
}

