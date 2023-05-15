package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import model.User;

public abstract class AbstracEntityDao<T> {
	private Class<T> entityClass;

	public AbstracEntityDao(Class<T> sls) {
		this.entityClass = sls;
	}

	public void insert(T entity) {
		EntityManager em = jpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin(); // bắt đầu giao dịch
			em.persist(entity); // thêm entity vào
			trans.commit(); // hoàn thành giao dịch
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(T entity) {
		EntityManager em = jpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin(); // bắt đầu giao dịch
			em.merge(entity); // thêm entity vào
			trans.commit(); // hoàn thành giao dịch
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(Object id) {
		EntityManager em = jpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin(); // bắt đầu giao dịch
			T entity = em.find(entityClass, id);
			em.remove(entity);
			trans.commit(); // hoàn thành giao dịch
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public T findbyId(Object id) {
		EntityManager em = jpaUtils.getEntityManager();
		T entity = em.find(entityClass, id);
		return entity;
	}

	public List<T> findAll() {
		EntityManager em = jpaUtils.getEntityManager();
		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			return em.createQuery(cq).getResultList();
		} finally {
			em.close();
		}

	}

	public Long count() {
		EntityManager em = jpaUtils.getEntityManager();

		CriteriaQuery cq = em.getCriteriaBuilder().createQuery();

		Root<T> rt = cq.from(entityClass);
		cq.select(em.getCriteriaBuilder().count(rt));
		Query q = em.createQuery(cq);
		return (Long) q.getSingleResult();

	}

	public List<T> findAll(boolean all, int fistResult, int maxResult) {
		EntityManager em = jpaUtils.getEntityManager();
		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			Query q = em.createQuery(cq);
			if (!all) {
				q.setFirstResult(fistResult);
				q.setMaxResults(maxResult);
			}

		} finally {
			em.close();

		}

		return null;
	}

}
