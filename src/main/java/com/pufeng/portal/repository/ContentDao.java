package com.pufeng.portal.repository;

import com.pufeng.portal.entity.Content;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: Juchen
 * Date: 13-7-7
 * Time: 下午8:46
 */
public interface ContentDao extends PagingAndSortingRepository<Content, Long>, JpaSpecificationExecutor<Content> {
}
