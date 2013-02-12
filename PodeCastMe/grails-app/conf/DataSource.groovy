dataSource {
    pooled = true
	
   // driverClassName = "org.h2.Driver"

   
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
      
			username = "root"
			password = ""
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			url = "jdbc:mysql://localhost/db_podcastme"
			pooled = true
			
			properties {
				maxActive = 50
				maxIdle = 25
				minIdle = 5
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "/* ping */"
			}
			  }
    }
    test {
        dataSource {
//            dbCreate = "update"
//           // url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//        
//			driverClassName = "com.mysql.jdbc.Driver"
//			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
//			url = "jdbc:mysql://127.0.0.1/db_podcastme"
//			pooled = true
			}
    }
    production {
        dataSource {
			
			username = "laraki"
			password = "22222222"
            dbCreate = "update"
           // url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			driverClassName = "com.cloudbees.jdbc.Driver"
			url = "[[jdbc:cloudbees://podcastme]]"
			pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
