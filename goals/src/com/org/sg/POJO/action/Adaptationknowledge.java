package com.org.sg.POJO.action;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.Action;
import com.org.coursegenrator.utilities.Constants;

/**
 * Adaptationknowledge entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "adaptationknowledge")
@ResultPath(value = "/")
@Results({ 
	    @Result(name = "success", location = "testSWF1.jsp"),
		@Result(name = "index", location = "index.jsp"),
		@Result(name = "indexTest", location = "indexTest.jsp"),
		@Result(name = Constants.SHOW, location = "showAK.jsp")})
public class Adaptationknowledge extends AbstractPOJO implements java.io.Serializable, Action {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 4719282292503404642L;
	private Integer id;
	private Pedagogicalresource pedagogicalresource;
	private Project project;
	private String rule;
	private String description;
	private Integer sortOrder;

	// Constructors

	/** default constructor */
	public Adaptationknowledge() {
	}

	/** minimal constructor */
	public Adaptationknowledge(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Adaptationknowledge(Integer id,
			Pedagogicalresource pedagogicalresource, Project project,
			String rule, String description, Integer sortOrder) {
		this.id = id;
		this.pedagogicalresource = pedagogicalresource;
		this.project = project;
		this.rule = rule;
		this.description = description;
		this.sortOrder = sortOrder;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pedagogicalresource")
	public Pedagogicalresource getPedagogicalresource() {
		return this.pedagogicalresource;
	}

	public void setPedagogicalresource(Pedagogicalresource pedagogicalresource) {
		this.pedagogicalresource = pedagogicalresource;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@Column(name = "rule", length = 65535)
	public String getRule() {
		return this.rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "sortOrder")
	public Integer getSortOrder() {
		return this.sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}

	@Override
	public String execute() throws Exception {

		return this.getAction();
	}

}