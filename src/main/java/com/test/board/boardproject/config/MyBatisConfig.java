package com.test.board.boardproject.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.util.Objects;

@Configuration
@MapperScan(basePackages = "com.test.board.boardproject.mapper")
public class MyBatisConfig {

    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource)  throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        Resource[] arrResources = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
        sqlSessionFactoryBean.setMapperLocations(arrResources);
        sqlSessionFactoryBean.setVfs(SpringBootVFS.class);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.test.board.boardproject.domain");

        org.apache.ibatis.session.Configuration sessionConfig = Objects.requireNonNull(sqlSessionFactoryBean.getObject()).getConfiguration();
        sessionConfig.setMapUnderscoreToCamelCase(true);
        sessionConfig.setCallSettersOnNulls(true);
        sessionConfig.setCallSettersOnNulls(false);

        return sqlSessionFactoryBean.getObject();
    }
}
