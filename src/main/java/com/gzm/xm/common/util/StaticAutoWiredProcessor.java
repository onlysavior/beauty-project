package com.gzm.xm.common.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.ClassUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class StaticAutoWiredProcessor implements BeanPostProcessor, ApplicationContextAware {

    // spring上下文
    private ApplicationContext context;

    private static final Map<Class<?>, Object> beanStaticMap = new ConcurrentHashMap<Class<?>, Object>();

    private static final Object beanStaticInitLock = new Object();

    // 缓存表
    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName)
            throws BeansException {
        return bean;
    }

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName)
            throws BeansException {
        Class beanClazz = bean.getClass();
        if (!beanStaticMap.containsKey(beanClazz)) {
            synchronized (beanStaticInitLock) {
                if (!beanStaticMap.containsKey(beanClazz)) {
                    Set<Class<?>> cls = getAllInterfacesAndSuperClass(beanClazz);
                    cls.add(beanClazz);
                    for (Class<?> clazz : cls) {
                        Field[] fields = clazz.getDeclaredFields();
                        for (Field f : fields) {
                            if (Modifier.isStatic(f.getModifiers())) {
                                if (!f.isAnnotationPresent(StaticAutoWired.class)) {
                                    continue;
                                }
                                boolean needResetAccessible = false;
                                try {
                                    if (!f.isAccessible()) {
                                        f.setAccessible(true);
                                        needResetAccessible = true;
                                    }

                                    Qualifier qa = f.getAnnotation(Qualifier.class);
                                    Object beanFound = (qa == null ? BeanFactoryUtils.beanOfType(
                                            context, f.getType()) : context.getBean(qa.value()));

                                    f.set(null, beanFound);
                                } catch (IllegalArgumentException e) {
                                    e.printStackTrace();
                                } catch (IllegalAccessException e) {
                                    e.printStackTrace();
                                } finally {
                                    if (needResetAccessible) {
                                        f.setAccessible(false);
                                    }
                                }
                            }
                        }
                    }
                    beanStaticMap.put(beanClazz, "");
                }
            }
        }
        return bean;
    }

    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        this.context = context;
    }

    public static Set<Class<?>> getAllInterfacesAndSuperClass(Class<?> targetClazz) {
        Set<Class<?>> cls = new HashSet<Class<?>>();
        Class<?>[] interfaces = ClassUtils.getAllInterfacesForClass(targetClazz);
        for (Class<?> clazz : interfaces) {
            cls.add(clazz);
        }
        Class<?> clazz = targetClazz.getSuperclass();
        while(clazz != null) {
            cls.add(clazz);
            clazz = clazz.getSuperclass();
        }
        return cls;
    }

}