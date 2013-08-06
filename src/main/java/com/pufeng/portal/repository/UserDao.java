package com.pufeng.portal.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.pufeng.portal.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}
