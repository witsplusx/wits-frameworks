package com.wits.techrsh.dddmicro.meituan.lottery.domain.aggregate;

import com.wits.techrsh.dddmicro.meituan.lottery.domain.valobj.AwardPool;
import com.wits.techrsh.dddmicro.meituan.lottery.domain.valobj.DrawLotteryContext;

import java.util.List;

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.techrsh.dddmicro.meituan.lottery.entity.aggregate
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-26 10:36
 * @desc
 * @see
 */
public class DrawLottery {

    private int lotteryId;

    private List<AwardPool> awardPools;

    public void setLotteryId(int lotteryId) {
        if(lotteryId <= 0) {
            throw new IllegalArgumentException("id is not expands");
        }
        this.lotteryId = lotteryId;
    }

    public AwardPool chooseAwardPool(DrawLotteryContext context) {
        return null;
    }

}
