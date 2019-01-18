package com.wits.frameworks.core.algorithm.loadblc;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigInteger;
import java.util.List;

import static com.google.common.base.Preconditions.checkNotNull;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.core.algorithm.loadblc
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2019-01-17 17:14
 * @desc
 * @see
 */
public class WeightedRoundRobinScheduling {

    private static final Logger LOGGER = LoggerFactory.getLogger(WeightedRoundRobinScheduling.class);

    /**
     * 上一次选择的服务器
     */
    private int currentIndex = -1;
    /**
     * 当前调度的权值
      */
    private int currentWeight = 0;
    /**
     * 最大权重
     */
    private int maxWeight = 0;
    /**
     * 所有服务器权重的最大公约数
     */
    private int gcdWeight = 0;
    /**
     * 服务器数量
     */
    private int serverCount = 0;

    private List<ServerInst> svrInsts;

    private volatile static WeightedRoundRobinScheduling weiRoundRobin;

    private WeightedRoundRobinScheduling() {}

    public static WeightedRoundRobinScheduling getInstance() {
        if(weiRoundRobin == null) {
            synchronized (WeightedRoundRobinScheduling.class) {
                if(weiRoundRobin == null) {
                    weiRoundRobin = new WeightedRoundRobinScheduling();
                }
            }
        }
        return weiRoundRobin;
    }

    /**
     * 返回最大公约数
     * @param a
     * @param b
     * @return
     */
    private static int gcd(int a, int b) {
        BigInteger b1 = new BigInteger(String.valueOf(a));
        BigInteger b2 = new BigInteger(String.valueOf(b));
        BigInteger gcd = b1.gcd(b2);
        return gcd.intValue();
    }

    /**
     * 返回所有服务器权重的最大公约数
     * @param insts
     * @return
     */
    private static int getGCDForServers(List<ServerInst> insts) {
        int w = 0;
        for (int i = 0, len = insts.size(); i < len - 1; i++) {
            if (w == 0) {
                w = gcd(insts.get(i).getWeight(), insts.get(i + 1).getWeight());
            } else {
                w = gcd(w, insts.get(i + 1).getWeight());
            }
        }
        return w;
    }

    /**
     * 返回所有服务器中的最大权重
     * @param insts
     * @return
     */
    private static int getMaxWeightForServers(List<ServerInst> insts) {
        int w = 0;
        for (int i = 0, len = insts.size(); i < len - 1; i++) {
            if (w == 0) {
                w = Math.max(insts.get(i).getWeight(), insts.get(i + 1).getWeight());
            } else {
                w = Math.max(w, insts.get(i + 1).getWeight());
            }
        }
        return w;
    }

    public void initSvrInsts(List<ServerInst> insts) {
        checkNotNull(insts);
        svrInsts = insts;
        currentIndex = -1;
        currentWeight = 0;
        serverCount = svrInsts.size();
        maxWeight = getMaxWeightForServers(svrInsts);
        gcdWeight = getGCDForServers(svrInsts);
    }

    /**
     *  算法流程：
     *  假设有一组服务器 S = {S0, S1, …, Sn-1}
     *  有相应的权重，变量currentIndex表示上次选择的服务器
     *  权值currentWeight初始化为0，currentIndex初始化为-1 ，当第一次的时候返回 权值取最大的那个服务器，
     *  通过权重的不断递减 寻找 适合的服务器返回，直到轮询结束，权值返回为0
     */
    public ServerInst getInst() {
        while (true) {
            currentIndex = (currentIndex + 1) % serverCount;
            if (currentIndex == 0) {
                currentWeight = currentWeight - gcdWeight;
                if (currentWeight <= 0) {
                    currentWeight = maxWeight;
                    if (currentWeight == 0) {
                        return null;
                    }
                }
            }
            if (svrInsts.get(currentIndex).getWeight() >= currentWeight) {
                return svrInsts.get(currentIndex);
            }
         }
    }

}
