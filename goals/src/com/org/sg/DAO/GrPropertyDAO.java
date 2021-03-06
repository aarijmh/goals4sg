package com.org.sg.DAO;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.org.sg.POJO.action.GrProperty;

/**
 * A data access object (DAO) providing persistence and search support for
 * GrProperty entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.org.sg.POJO.action.GrProperty
 * @author MyEclipse Persistence Tools
 */
public class GrPropertyDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(GrPropertyDAO.class);
	// property constants
	public static final String PARAMETER = "parameter";
	public static final String NAME = "name";
	public static final String VALUE = "value";

	public void save(GrProperty transientInstance) {
		log.debug("saving GrProperty instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GrProperty persistentInstance) {
		log.debug("deleting GrProperty instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GrProperty findById(java.lang.Integer id) {
		log.debug("getting GrProperty instance with id: " + id);
		try {
			GrProperty instance = (GrProperty) getSession().get(
					"com.org.sg.POJO.action.GrProperty", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<GrProperty> findByExample(GrProperty instance) {
		log.debug("finding GrProperty instance by example");
		try {
			List<GrProperty> results = (List<GrProperty>) getSession()
					.createCriteria("com.org.sg.POJO.GrProperty")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding GrProperty instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from GrProperty as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<GrProperty> findByParameter(Object parameter) {
		return findByProperty(PARAMETER, parameter);
	}

	public List<GrProperty> findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List<GrProperty> findByValue(Object value) {
		return findByProperty(VALUE, value);
	}

	public List findAll() {
		log.debug("finding all GrProperty instances");
		try {
			String queryString = "from GrProperty";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GrProperty merge(GrProperty detachedInstance) {
		log.debug("merging GrProperty instance");
		try {
			GrProperty result = (GrProperty) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GrProperty instance) {
		log.debug("attaching dirty GrProperty instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GrProperty instance) {
		log.debug("attaching clean GrProperty instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public List<GrProperty> findOfGameResource(Integer id) {
		log.debug("finding all GrProperty instances");
		try {
			String queryString = "from GrProperty where gameresource.id = :ID ";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter("ID", id);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public void deleteOfGR(Integer id) {
		try {
			String queryString = "delete from GrProperty where  gameresource.id = :CID";
			Query query = getSession().createQuery(queryString);
			query.setInteger("CID", id);
			query.executeUpdate();
			
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}