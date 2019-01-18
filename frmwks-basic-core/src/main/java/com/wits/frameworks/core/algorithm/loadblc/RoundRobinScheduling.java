package com.wits.frameworks.core.algorithm.loadblc;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.algorithm.loadblc
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-17 16:45
 * @desc
 *
 * 轮训调度算法
 *
 * @see
 */
public class RoundRobinScheduling {

    private volatile static RoundRobinScheduling roundRobin;

    private RoundRobinScheduling() {

    }

    public static RoundRobinScheduling getInstance() {
        if(roundRobin == null) {
            synchronized (RoundRobinScheduling.class) {
                if (roundRobin == null) {
                    roundRobin = new RoundRobinScheduling();
                }
            }
        }
        return roundRobin;
    }

    public int getRoundRobinIdx(int i, int n) {
        int j = i;
        do {
            j = (i + 1) % n;
            i = j;
        } while (j != i);
        return i;
    }



}
