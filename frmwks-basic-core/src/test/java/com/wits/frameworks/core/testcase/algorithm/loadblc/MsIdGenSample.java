package com.wits.frameworks.core.testcase.algorithm.loadblc;

import cn.hutool.db.Db;
import cn.hutool.db.Entity;
import cn.hutool.db.ds.DSFactory;
import com.google.common.collect.Lists;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.ListeningExecutorService;
import com.google.common.util.concurrent.MoreExecutors;
import com.wits.frameworks.core.algorithm.loadblc.RoundRobinScheduling;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.testcase.algorithm.loadblc
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-17 20:23
 * @desc
 * @see
 */
public class MsIdGenSample {

    public static volatile Integer idx;

    public static void main(String[] args)  {

        try {
            /*DataSource source = SimpleDataSource.getDataSource();
            ((SimpleDataSource) source).setDriver("com.mysql.jdbc.Driver");
            ((SimpleDataSource) source).setUser("root");
            ((SimpleDataSource) source).setPass("wits");
            ((SimpleDataSource) source).setUrl("jdbc:mysql://127.0.0.1:13061/wits_plusx_db?characterEncoding=utf8&useSSL=false&nullNamePatternMatchesAll=true");
            *//*String name = new JdbcSession(source)
                .sql("SELECT name FROM foo WHERE id = ?")
                .set(123)
                .select(new SingleOutcome<>(String.class));*//*
            JdbcSession session1 = new JdbcSession(source);
            Long idx = session1.sql("REPLACE INTO Sequence(stub) VALUES ('a');SELECT LAST_INSERT_ID();")
                    .select(new SingleOutcome<>(Long.class));*/


//            DSFactory.setCurrentDSFactory(new HikariDSFactory());
            List<Db> dbCls = new ArrayList<>(4);
            DataSource ds1 = DSFactory.get("mysql_idgen_node1");
            Db db1 = Db.use(ds1);
            dbCls.add(db1);

            DataSource ds2 = DSFactory.get("mysql_idgen_node2");
            Db db2 = Db.use(ds2);
            dbCls.add(db2);

            DataSource ds3 = DSFactory.get("mysql_idgen_node3");
            Db db3 = Db.use(ds3);
            dbCls.add(db3);

            idx = dbCls.size() - 1;
            final Integer all = dbCls.size();

//            List<ListenableFuture<Integer>> futures = Lists.newArrayList();
            ExecutorService pool = Executors.newFixedThreadPool(100);//定义线程数
            ListeningExecutorService executorService = MoreExecutors.listeningDecorator(pool);

            for (int i = 0; i < 100; i++) {
//                futures.add(executorService.submit(new GuavaMultiThread.Task(list.get(i))));

                executorService.submit(()->{
                    Db tmp;
                    for(int j=0; j<1000; j++) {
                        idx = RoundRobinScheduling.getInstance().getRoundRobinIdx(idx, all);
                        tmp = dbCls.get(idx);
                        final String log = Thread.currentThread().getName() + "=====N[" + idx + "]=";
                        try {
                            tmp.tx(tdb -> {
                                tdb.execute("REPLACE INTO seq_comm(stub) VALUES ('a');");
                                Entity entity = tdb.queryOne("SELECT LAST_INSERT_ID() as id;");
                                System.out.println(log + entity.getLong("id"));
                            });
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                        }
                    }
                });

            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }



    }





}
