package com.saloon.service;

import java.util.List;

/**
 * Common abstraction for Services to support polymorphic behavior.
 */
public interface UserService<T> {
    void create(T entity);
    T read(String id);
    List<T> readAll();
    void update(T entity);
    void delete(String id);
}
