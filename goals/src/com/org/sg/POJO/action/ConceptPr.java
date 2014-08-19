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
 * ConceptPr entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "concept_pr")
public class ConceptPr implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 4108088160377242636L;
	private Integer id;
	private Pedagogicalresource pedagogicalresource;
	private Concept concept;
	private String requiredKnowledge;
	private String value;

	// Constructors

	/** default constructor */
	public ConceptPr() {
	}

	/** minimal constructor */
	public ConceptPr(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public ConceptPr(Integer id, Pedagogicalresource pedagogicalresource,
			Concept concept, String requiredKnowledge, String value) {
		this.id = id;
		this.pedagogicalresource = pedagogicalresource;
		this.concept = concept;
		this.requiredKnowledge = requiredKnowledge;
		this.value = value;
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
	@JoinColumn(name = "pedagogicalResource")
	public Pedagogicalresource getPedagogicalresource() {
		return this.pedagogicalresource;
	}

	public void setPedagogicalresource(Pedagogicalresource pedagogicalresource) {
		this.pedagogicalresource = pedagogicalresource;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "concept")
	public Concept getConcept() {
		return this.concept;
	}

	public void setConcept(Concept concept) {
		this.concept = concept;
	}

	@Column(name = "requiredKnowledge", length = 65535)
	public String getRequiredKnowledge() {
		return this.requiredKnowledge;
	}

	public void setRequiredKnowledge(String requiredKnowledge) {
		this.requiredKnowledge = requiredKnowledge;
	}

	@Column(name = "value", length = 65535)
	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}