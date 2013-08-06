package com.pufeng.portal.service.admin;

import com.pufeng.portal.entity.Content;
import com.pufeng.portal.repository.ContentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;

/**
 * User: Juchen
 * Date: 13-7-7
 * Time: 下午8:46
 */
@Component
@Transactional (readOnly = true)
public class ContentService {

    private ContentDao contentDao;

    @Transactional (readOnly = false)
    public void save(Content content){
        contentDao.save(content);
    }

    @Autowired
    public void setContentDao(ContentDao contentDao) {
        this.contentDao = contentDao;
    }

    public Page<Content> listWithParentType(int pageNumber, int pageSize, final String parentType){
        return contentDao.findAll(new Specification<Content>() {
            @Override
            public Predicate toPredicate(Root<Content> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> ptype = contentRoot.get("parentType");
                criteriaQuery.where(criteriaBuilder.equal(ptype,parentType));
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize));
    }

    public Page<Content> listWithAllType(int pageNumber, int pageSize, final String parentType, final String subType){
        return contentDao.findAll(new Specification<Content>() {
            @Override
            public Predicate toPredicate(Root<Content> contentRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> ptype = contentRoot.get("parentType");
                Path<String> stype = contentRoot.get("subType");
                criteriaQuery.where(criteriaBuilder.equal(ptype,parentType)).where(criteriaBuilder.equal(stype, subType));
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize));
    }

    public Content findById(Long contentId){
        return contentDao.findOne(contentId);
    }

    @Transactional (readOnly = false)
    public void delete(Long contentId){
        contentDao.delete(contentId);
    }

    public Content findBySubType(final String subType){
        Sort sort = new Sort(Sort.Direction.DESC,"id");
            Page<Content> contentPage = contentDao.findAll(new Specification<Content>() {
            @Override
            public Predicate toPredicate(Root<Content> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Path<String> stype = root.get("subType");
                query.where(cb.equal(stype,subType));
                return null;
            }
        }, new PageRequest(0,1,sort));
        if (contentPage.getContent().size()>0){
            return contentPage.getContent().get(0);
        } else {
            return null;
        }
    }

    public Page<Content> findBySubTypeWithPage(int pageNumber, int pageSize, final String subType){
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        return contentDao.findAll(new Specification<Content>() {
            @Override
            public Predicate toPredicate(Root<Content> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Path<String> stype = root.get("subType");
                query.where(cb.equal(stype,subType));
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize, sort));
    }

    public Page<Content> search(int pageNumber, int pageSize, final String param){
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        return contentDao.findAll(new Specification<Content>() {
            @Override
            public Predicate toPredicate(Root<Content> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Path<String> content = root.get("content");
                query.where(cb.like(content, "%"+param+"%"));
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize, sort));
    }
}
