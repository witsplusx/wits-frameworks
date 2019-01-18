package com.wits.frameworks.core.testcase.algorithm.loadblc;

import com.google.common.collect.Lists;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.ListeningExecutorService;
import com.google.common.util.concurrent.MoreExecutors;
import com.wits.frameworks.core.algorithm.loadblc.RoundRobinScheduling;
import com.wits.frameworks.core.algorithm.loadblc.ServerInst;
import com.wits.frameworks.core.algorithm.loadblc.WeightedRoundRobinScheduling;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.algorithm.loadblc
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-17 17:24
 * @desc
 * @see
 */
public class RoundRobinTests {

    private static volatile Integer idx;
    private static List<String> list;

    /**
     * 内部类，用于处理售票
     */
    class Task implements Callable<Integer> {

        private int i;
        private int n;

        /**
         * 构造方法，用于参数传递
         */
        public Task(int idx, int all) {
            this.i = idx;
            this.n = all;
        }

        @Override
        public Integer call() throws Exception {
            idx = RoundRobinScheduling.getInstance().getRoundRobinIdx(i, n);
            System.out.println(Thread.currentThread().getName() + "=====N[" + idx + "]=" + list.get(idx));
            return 1;
        }
    }

    public void testRoundRobin() {

        list = new ArrayList<>();
        list.add("1");
        list.add("2");
        list.add("3");
        /*list.add("4");
        list.add("5");
        list.add("6");
        list.add("7");
        list.add("8");
        list.add("9");
        list.add("10");
        list.add("11");*/
        final int n = list.size();
        idx = n - 1;


        List<ListenableFuture<Integer>> futures = Lists.newArrayList();

        ExecutorService pool = Executors.newFixedThreadPool(9);//定义线程数

        ListeningExecutorService executorService = MoreExecutors.listeningDecorator(pool);


        for (int step = 0; step <= 100; step++) {
            futures.add(executorService.submit(new Task(idx, n)));
        }

        final ListenableFuture<List<Integer>> resultsFuture = Futures.successfulAsList(futures);
        try {//所有都执行完毕
            resultsFuture.get();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("操作完毕");
            pool.shutdown();
        }

    }


    public static void main(String[] args) {

        RoundRobinTests tst = new RoundRobinTests();
        tst.testRoundRobin();

        /*ServerInst s1 = new ServerInst("192.168.0.1", 3);
        ServerInst s2 = new ServerInst("192.168.0.1", 2);
        ServerInst s3 = new ServerInst("192.168.0.1", 6);
        ServerInst s4 = new ServerInst("192.168.0.1", 4);
        ServerInst s5 = new ServerInst("192.168.0.1", 1);
        List<ServerInst> insts = new ArrayList<>(8);
        insts.add(s1);
        insts.add(s2);
        insts.add(s3);
        insts.add(s4);
        insts.add(s5);

        WeightedRoundRobinScheduling.getInstance().initSvrInsts(insts);

        Map<String, Integer> countResult = new HashMap<>();

        ServerInst tmp = null;
        for(int i=0; i<100; i++) {
            tmp = WeightedRoundRobinScheduling.getInstance().getInst();
            String log = "instcode:"+ tmp.getInstUniCode() + ";weight:" + tmp.getWeight();
            if(countResult.containsKey(log)) {
                countResult.put(log, countResult.get(log)+1);
            } else {
                countResult.put(log, 1);
            }
            System.out.println(log);
        }

        for(Map.Entry<String, Integer> map : countResult.entrySet()){
            System.out.println("服务器 "+map.getKey()+" 请求次数： "+map.getValue());
        }*/

    }


}
