package com.org.sg.POJO.action;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PresentationPr entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "presentation_pr")
public class PresentationPr implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 2239225667163465506L;
	private Integer id;
	private Presentation presentation;
	private Types types;
	private String description;

	// Constructors

	/** default constructor */
	public PresentationPr() {
	}

	/** minimal constructor */
	public PresentationPr(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public PresentationPr(Integer id, Presentation presentation, Types types,
			String description) {
		this.id = id;
		this.presentation = presentation;
		this.types = types;
		this.description = description;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "presentation")
	public Presentation getPresentation() {
		return this.presentation;
	}

	public void setPresentation(Presentation presentation) {
		this.presentation = presentation;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "type")
	public Types getTypes() {
		return this.types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}