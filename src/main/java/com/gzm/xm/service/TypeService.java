package com.gzm.xm.service;

import com.gzm.xm.common.entity.Type;
import com.gzm.xm.dao.TypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeService {
    @Autowired
    private TypeDao typeDao;
    
    public List<Type> getAllType(Integer parentId){
    	if(parentId  == null){
    		return typeDao.getAllTypes();
    	}else{
    		return typeDao.getSubTypeListByType(parentId);
    	}
    }

    public Type getType(Integer id) {
        return typeDao.findOne(id);
    }

    public List<Type> getSubTypeListUnderType(Integer id) {
        return typeDao.getSubTypeListByType(id);
    }

    public List<Type> getNewsType() {
        return typeDao.getNewsType();
    }

    public void addType(String name, Integer parentType) {
        Type type = new Type();
        type.setName(name);
        type.setParentType(parentType);

        typeDao.save(type);
    }

    public void delType(Integer id) {
        typeDao.delete(id);
    }

   
    public void saveType(Type t) {
        typeDao.save(t);
    }

    public Type getTypeByNameAndParent(String name, Integer id) {
       return typeDao.getTypeByNameAndParent(name, id);
    }
}
