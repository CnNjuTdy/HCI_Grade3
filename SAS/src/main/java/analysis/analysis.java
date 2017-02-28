package analysis;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.KDJDAO;
import dao.MACDDAO;
import dao.StockDAO;
import entity.Condition;
import entity.KDJ;
import entity.MACD;
import entity.MACDCondition;
import entity.ROLL;
import entity.ROLLCondition;
import entity.RSI;
import entity.RSICondition;
import entity.Stock;
import servlet.stock_search;

public class analysis {
    private static final long serialVersionUID = 1L;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    StockDAO stockDAO;
    

    /**
     * 此处与压力位支撑位结合分析更好，待完成
     *  * 适用于大盘股，不适用于小盘、冷门股，且超买超卖时宜与其他指标相结合
     *  * KDJ指标较敏感，易被操纵
     *  * J线为方向敏感线，当J值大于90，特别是连续5天以上，股价至少会形成短期头部，
     *  * 反之J值小于10时，特别是连续数天以上，股价至少会形成短期底部。
     *
     * @param list
     * @return
     */
    public Condition judgeKDJ(List<KDJ> list, String id) {
        Condition condition = new Condition();
        int len = list.size();
        if (list.get(len - 1).getKvalue() >= 90) {
            condition.setBuyarea(condition.getBuyarea() + 1);
        }
        if (list.get(len - 1).getDvalue() >= 80) {
            condition.setBuyarea(condition.getBuyarea() + 1);
        }
        if (list.get(len - 1).getJvalue() >= 100) {
            condition.setBuyarea(condition.getBuyarea() + 1);
        }
        if (list.get(len - 1).getKvalue() <= 10) {
            condition.setSellarea(condition.getSellarea() + 1);
        }
        if (list.get(len - 1).getDvalue() <= 20) {
            condition.setSellarea(condition.getSellarea() + 1);
        }
        if (list.get(len - 1).getJvalue() <= 0) {
            condition.setSellarea(condition.getSellarea() + 1);
        }
        for (int i = 3; i > 0; i--) {
            if (list.get(len - i - 1).getKvalue() < list.get(len - i - 1).getDvalue()
                    && list.get(len - i).getKvalue() > list.get(len - i).getDvalue()) {
                if (list.get(len - i).getKvalue() <= 20) {
                    condition.setBuysiginal(condition.getBuysiginal() + 4 - i);
                }
            }
            if (list.get(len - i - 1).getKvalue() > list.get(len - i - 1).getDvalue()
                    && list.get(len - i).getKvalue() < list.get(len - i).getDvalue()) {
                if (list.get(len - i).getDvalue() >= 80) {
                    condition.setSellsiginal(condition.getSellsiginal() + 4 - i);
                }
            }
        }
        for (int i = 4; i > 0; i--) {
            if (list.get(len - i).getKvalue() - list.get(len - i - 1).getKvalue() < 2
                    && list.get(len - i).getKvalue() - list.get(len - i - 1).getKvalue() > -2
                    && list.get(len - i).getDvalue() - list.get(len - i - 1).getDvalue() < 2
                    && list.get(len - i).getDvalue() - list.get(len - i - 1).getDvalue() > -2) {
                if (i == 1) {
                    condition.setChange(1);
                } else {
                    continue;
                }
            } else {
                break;
            }
        }
        List<Stock> stocks = new ArrayList<Stock>();
        stockDAO = new StockDAO();
        try {
            stocks = stockDAO.getDefaultList(id, sdf.parse("2016-06-16"), 4);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if ((stocks.get(0).getClose() > stocks.get(1).getClose() &&
                stocks.get(1).getClose() > stocks.get(2).getClose() &&
                stocks.get(2).getClose() > stocks.get(3).getClose() &&
                list.get(len - 4).getKvalue() < list.get(len - 3).getKvalue() &&
                list.get(len - 3).getKvalue() < list.get(len - 2).getKvalue() &&
                list.get(len - 2).getKvalue() < list.get(len - 1).getKvalue())
                || (stocks.get(0).getClose() < stocks.get(1).getClose() &&
                stocks.get(1).getClose() < stocks.get(2).getClose() &&
                stocks.get(2).getClose() < stocks.get(3).getClose() &&
                list.get(len - 4).getKvalue() > list.get(len - 3).getKvalue() &&
                list.get(len - 3).getKvalue() > list.get(len - 2).getKvalue() &&
                list.get(len - 2).getKvalue() > list.get(len - 1).getKvalue())) {
            condition.setChange(2);
        }
        if (list.get(len - 1).getKvalue() > 50 && list.get(len - 1).getDvalue() > 50 && list.get(len - 1).getJvalue() > 50) {
            condition.setMarket(1);
        }
        if (list.get(len - 1).getKvalue() < 50 && list.get(len - 1).getDvalue() < 50 && list.get(len - 1).getJvalue() < 50) {
            condition.setMarket(-1);
        }
        return condition;
    }

    /**
     * DIF线与K线发生背离，行情可能出现反转信号;
     * DEA 在盘整局面时失误率较高,但如果配合 RSI 及 KDj 指标可适当弥补缺点；
     * 牛皮市道中指标将失真；
     * 由于MACD是一项中、长线指标，买进点、卖出点和最低价、最高价之间的价差较大；
     * 当行情忽上忽下幅度太小或盘整时，按照信号进场后随即又要出场，买卖之间可能没有利润；
     * 一两天内涨跌幅度特别大时，MACD来不及反应，因为MACD的移动相当缓和，比较行情的移动有一定的时间差；
     * 所以一旦行情迅速大幅涨跌，MACD不会立即产生信号，此时，MACD无法发生作用；
     */
    public MACDCondition judgeMACD(List<MACD> list, String id) {
        MACDCondition mACDCondition = new MACDCondition();
        int len = list.size();
        if (list.get(len - 3).getDIF() > 0 && list.get(len - 2).getDIF() > 0 && list.get(len - 1).getDIF() > 0 &&
                list.get(len - 3).getMACD() > 0 && list.get(len - 2).getMACD() > 0 && list.get(len - 1).getMACD() > 0) {
            if (list.get(len - 3).getDIF() < list.get(len - 2).getDIF() &&
                    list.get(len - 2).getDIF() < list.get(len - 1).getDIF() &&
                    list.get(len - 3).getMACD() < list.get(len - 2).getMACD() &&
                    list.get(len - 2).getMACD() < list.get(len - 1).getMACD()) {
                mACDCondition.setMarket(1);
            }
        }
        if (list.get(len - 3).getDIF() < 0 && list.get(len - 2).getDIF() < 0 && list.get(len - 1).getDIF() < 0 &&
                list.get(len - 3).getMACD() < 0 && list.get(len - 2).getMACD() < 0 && list.get(len - 1).getMACD() < 0) {
            if (list.get(len - 3).getDIF() > list.get(len - 2).getDIF() &&
                    list.get(len - 2).getDIF() > list.get(len - 1).getDIF() &&
                    list.get(len - 3).getMACD() > list.get(len - 2).getMACD() &&
                    list.get(len - 2).getMACD() > list.get(len - 1).getMACD()) {
                mACDCondition.setMarket(-1);
            }
        }
        if (list.get(len - 3).getDIF() > 0 && list.get(len - 2).getDIF() > 0 && list.get(len - 1).getDIF() > 0 &&
                list.get(len - 3).getMACD() > 0 && list.get(len - 2).getMACD() > 0 && list.get(len - 1).getMACD() > 0) {
            if (list.get(len - 3).getDIF() > list.get(len - 2).getDIF() &&
                    list.get(len - 2).getDIF() > list.get(len - 1).getDIF() &&
                    list.get(len - 3).getMACD() > list.get(len - 2).getMACD() &&
                    list.get(len - 2).getMACD() > list.get(len - 1).getMACD()) {
                mACDCondition.setTendency(-1);
            }
        }
        if (list.get(len - 3).getDIF() < 0 && list.get(len - 2).getDIF() < 0 && list.get(len - 1).getDIF() < 0 &&
                list.get(len - 3).getMACD() < 0 && list.get(len - 2).getMACD() < 0 && list.get(len - 1).getMACD() < 0) {
            if (list.get(len - 3).getDIF() < list.get(len - 2).getDIF() &&
                    list.get(len - 2).getDIF() < list.get(len - 1).getDIF() &&
                    list.get(len - 3).getMACD() < list.get(len - 2).getMACD() &&
                    list.get(len - 2).getMACD() < list.get(len - 1).getMACD()) {
                mACDCondition.setTendency(1);
            }
        }
        if (list.get(len - 2).getMACD() < 0 && list.get(len - 1).getMACD() > 0) {
            mACDCondition.setMarketchange(1);
        }
        if (list.get(len - 2).getMACD() > 0 && list.get(len - 1).getMACD() < 0) {
            mACDCondition.setMarketchange(-1);
        }
        if (list.get(len - 3).getDIF() > 0 && list.get(len - 2).getDIF() > 0 && list.get(len - 1).getDIF() > 0 &&
                list.get(len - 3).getDEA() > 0 && list.get(len - 2).getDEA() > 0 && list.get(len - 1).getDEA() > 0) {
            if (list.get(len - 3).getDIF() < list.get(len - 3).getDEA() &&
                    list.get(len - 1).getDIF() > list.get(len - 1).getDEA()) {
                mACDCondition.setSiginal(1);
            }
        }
        if (list.get(len - 3).getDIF() < 0 && list.get(len - 2).getDIF() < 0 && list.get(len - 1).getDIF() < 0 &&
                list.get(len - 3).getDEA() < 0 && list.get(len - 2).getDEA() < 0 && list.get(len - 1).getDEA() < 0) {
            if (list.get(len - 3).getDIF() > list.get(len - 3).getDEA() &&
                    list.get(len - 1).getDIF() < list.get(len - 1).getDEA()) {
                mACDCondition.setSiginal(-1);
            }
        }
        List<Stock> stocks = new ArrayList<Stock>();
        stockDAO = new StockDAO();

        Date date = null;
        try {
            date = sdf.parse("2016-06-16");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        stocks = stockDAO.getDefaultList(id, date, 4);
        if ((stocks.get(0).getClose() > stocks.get(1).getClose() &&
                stocks.get(1).getClose() > stocks.get(2).getClose() &&
                stocks.get(2).getClose() > stocks.get(3).getClose() &&
                list.get(len - 4).getDIF() < list.get(len - 3).getDIF() &&
                list.get(len - 3).getDIF() < list.get(len - 2).getDIF() &&
                list.get(len - 2).getDIF() < list.get(len - 1).getDIF())
                || (stocks.get(0).getClose() < stocks.get(1).getClose() &&
                stocks.get(1).getClose() < stocks.get(2).getClose() &&
                stocks.get(2).getClose() < stocks.get(3).getClose() &&
                list.get(len - 4).getDIF() > list.get(len - 3).getDIF() &&
                list.get(len - 3).getDIF() > list.get(len - 2).getDIF() &&
                list.get(len - 2).getDIF() > list.get(len - 1).getDIF())) {
            mACDCondition.setChange(1);
        }
        return mACDCondition;
    }

    /**
     * 每种类型股票的超卖超买值是不同的
     * 只有在牛市末期或熊市当中，超买才是比较可靠的入市讯号
     * 很好的买卖讯号:①趋势线的突破；②移动平均线的突破；③某种价格型态的完成
     * 强弱指标与股价或指数比较时，常会产生先行显示未来行情走势的特性，
     * 亦即股价或指数未涨而强弱指标先上升，股价或指数未跌而强弱指标先下降，其特性在股价的高峰与谷底反应最明显
     * 当强弱指标上升而股价反而下跌，或是强弱指标下降而股价反趋上涨，这种情况称之为“背驰”.
     * 当RSI在70至80上时，价位破顶而RSI不能破顶，这就形成了“顶背驰”，
     * 而当RSI在30至20下时，价位破底而RSI不能破底就形成了“底背驰”.
     * 这种强弱指标与股价变动，产生的背离现象，通常是被认为市场即将发生重大反转的讯号
     * 80-100 极强 卖出50-80 强 买入20-50 弱 观望0-20 极弱 买入
     * 当发生单边行情时,rsi指标在高档或低档时会有钝化的现象，因此会发生过早卖出或买进
     * RSI没有明显规则性的买进或卖出信号，当指针在高位时，仅能说明情行反转的可能性增高，但并没有办法进一步明确地指出时点
     * 一般而言,RSI的背离信号通常是事后验证，事前很难看出,RSI指标与股价的"背离"走势常常会发生滞后现象
     * 由于RSI是一种比率的指标，因此在趋势分析的能力上会较弱
     * 应该看到RSI指标的时间参数不同，其给出的结果就会不同
     * 超买、超卖出现后导致的指标钝化现象容易发出错误的操作信号
     */
    public RSICondition judgeRSI(String id) {
        RSICondition rSICondition = new RSICondition();
        List<RSI> list6 = getRSI(id, 6);
        int len6 = list6.size();
        List<RSI> list9 = getRSI(id, 9);
        int len9 = list9.size();
        List<RSI> list12 = getRSI(id, 12);
        int len12 = list12.size();
        if (list6.get(len6 - 1).getRSI() > 80) {
            rSICondition.setAppearance(1);
        }
        if (list6.get(len6 - 1).getRSI() < 20) {
            rSICondition.setAppearance(-1);
        }
        if (list6.get(len6 - 1).getRSI() > 90) {
            rSICondition.setBuyarea(rSICondition.getBuyarea() + 1);
        }
        if (list6.get(len6 - 1).getRSI() < 10) {
            rSICondition.setSellarea(rSICondition.getSellarea() + 1);
        }
        if (list6.get(len6 - 1).getRSI() > 50 && list9.get(len9 - 1).getRSI() > 50 && list12.get(len12 - 1).getRSI() > 50) {
            rSICondition.setMarket(1);
        }
        if (list6.get(len6 - 1).getRSI() < 50 && list9.get(len9 - 1).getRSI() < 50 && list12.get(len12 - 1).getRSI() < 50) {
            rSICondition.setMarket(-1);
        }
        if (list6.get(len6 - 1).getRSI() < 70 && list6.get(len6 - 1).getRSI() > 30 &&
                list6.get(len6 - 1).getRSI() < 70 && list6.get(len6 - 1).getRSI() > 30) {
            rSICondition.setValue(1);
        }
        if (list6.get(len6 - 1).getRSI() > list9.get(len9 - 1).getRSI() &&
                list9.get(len9 - 1).getRSI() > list12.get(len12 - 1).getRSI()) {
            rSICondition.setHeadmarket(1);
        }
        if (list6.get(len6 - 1).getRSI() < list9.get(len9 - 1).getRSI() &&
                list9.get(len9 - 1).getRSI() < list12.get(len12 - 1).getRSI()) {
            rSICondition.setHeadmarket(-1);
        }
        if (list9.get(len9 - 3).getRSI() < list12.get(len12 - 3).getRSI() &&
                list9.get(len9 - 3).getRSI() < 30 &&
                list9.get(len9 - 1).getRSI() > list12.get(len12 - 1).getRSI()) {
            rSICondition.setBuysiginal(rSICondition.getBuysiginal() + 1);
        }
        if (list9.get(len9 - 3).getRSI() > list12.get(len12 - 3).getRSI() &&
                list9.get(len9 - 3).getRSI() > 70 &&
                list9.get(len9 - 1).getRSI() < list12.get(len12 - 1).getRSI()) {
            rSICondition.setSellsiginal(rSICondition.getSellsiginal() + 1);
        }
        if (list9.get(len9 - 3).getRSI() < 50 && list12.get(len12 - 3).getRSI() < 50 &&
                list9.get(len9 - 1).getRSI() > 50 && list12.get(len12 - 1).getRSI() > 50) {
            rSICondition.setSiginal912(1);
        }
        if (list9.get(len9 - 3).getRSI() > 80 && list12.get(len12 - 3).getRSI() > 80 &&
                list9.get(len9 - 1).getRSI() < 80 && list12.get(len12 - 1).getRSI() < 80) {
            rSICondition.setSiginal912(2);
        }
        if (list9.get(len9 - 3).getRSI() > 50 && list12.get(len12 - 3).getRSI() > 50 &&
                list9.get(len9 - 1).getRSI() < 50 && list12.get(len12 - 1).getRSI() < 50) {
            rSICondition.setSiginal912(3);
        }
        return rSICondition;
    }

    public ROLLCondition judgeROLL(String id) {
        ROLLCondition rollCondition = new ROLLCondition();
        List<ROLL> list = new ArrayList<ROLL>();
        list = getRoll(id);
        stockDAO = new StockDAO();
        List<Stock> stocks = null;
        try {
            stocks = stockDAO.getDefaultList(id, sdf.parse("2016-06-16"), 4);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int len = list.size();
        int slen = stocks.size();
        int l = len - 1;
        int s = slen - 1;
        int mind = 0;
        int uind = 0;
        int dind = 0;
        int sind = 0;
        while (list.get(l).getMB() > list.get(l - 1).getMB()) {
            mind++;
            l--;
        }
        while (list.get(l).getUP() > list.get(l - 1).getUP()) {
            uind++;
            l--;
        }
        while (list.get(l).getDN() > list.get(l - 1).getDN()) {
            dind++;
            l--;
        }
        while (stocks.get(s).getClose() > stocks.get(s - 1).getClose()) {
            sind++;
            s--;
        }
        while (list.get(l).getMB() < list.get(l - 1).getMB()) {
            if (mind > 0) {
                break;
            }
            mind--;
            l--;
        }
        while (list.get(l).getUP() < list.get(l - 1).getUP()) {
            if (uind > 0) {
                break;
            }
            uind--;
            l--;
        }
        while (list.get(l).getDN() < list.get(l - 1).getDN()) {
            if (dind > 0) {
                break;
            }
            dind--;
            l--;
        }
        while (stocks.get(s).getClose() < stocks.get(s - 1).getClose()) {
            if (sind > 0) {
                break;
            }
            sind--;
            s--;
        }
        if (mind > 4 && uind > 4 && dind > 4) {
            rollCondition.setPriceten(1);
        }
        if (mind < -4 && uind < -4 && dind < -4) {
            rollCondition.setPriceten(-1);
        }
        if (mind < -4 && uind > 4 && dind > 4 && sind > 4) {
            rollCondition.setReorganize(1);
        }
        if (mind < -4 && uind > 5 && dind > 4 && sind > 4) {
            rollCondition.setReorganize(-1);
        }
        if (mind > 4 && uind < -4 && dind < -4) {
            rollCondition.setUpanddown(1);
        }
        if (mind < -4 && uind > 4 && dind > 4) {
            rollCondition.setUpanddown(-1);
        }
        if (stocks.get(slen - 4).getClose() < list.get(len - 4).getMB() && stocks.get(slen - 1).getClose() > list.get(len - 1).getMB()) {
            rollCondition.setCharacteristic(1);
        }
        if (stocks.get(slen - 4).getClose() < list.get(len - 4).getDN() && stocks.get(slen - 1).getClose() > list.get(len - 1).getDN()) {
            rollCondition.setCharacteristic(-1);
        }
        if (stocks.get(slen - 4).getClose() < list.get(len - 4).getUP() && stocks.get(slen - 4).getClose() > list.get(len - 4).getMB()
                && stocks.get(slen - 1).getClose() > list.get(len - 1).getUP()) {
            rollCondition.setCharacteristic(2);
        }
        if (stocks.get(slen - 4).getClose() > list.get(len - 4).getDN() && stocks.get(slen - 4).getClose() < list.get(len - 4).getMB()
                && stocks.get(slen - 1).getClose() < list.get(len - 1).getDN()) {
            rollCondition.setCharacteristic(-2);
        }
        if (sind >= 4 && mind >= 4 && stocks.get(slen - 1).getClose() > list.get(len - 1).getMB() &&
                stocks.get(slen - 2).getClose() > list.get(len - 2).getMB() &&
                stocks.get(slen - 3).getClose() > list.get(len - 3).getMB() &&
                stocks.get(slen - 4).getClose() > list.get(len - 4).getMB()) {
            rollCondition.setMid(1);
        }
        if (sind <= -4 && mind <= -4 && stocks.get(slen - 1).getClose() < list.get(len - 1).getMB() &&
                stocks.get(slen - 2).getClose() < list.get(len - 2).getMB() &&
                stocks.get(slen - 3).getClose() < list.get(len - 3).getMB() &&
                stocks.get(slen - 4).getClose() < list.get(len - 4).getMB()) {
            rollCondition.setMid(1);
        }
        if (sind >= 4 && stocks.get(slen - 4).getClose() < list.get(len - 4).getUP()
                && stocks.get(slen - 1).getClose() > list.get(len - 1).getUP() && mind >= 4 && uind >= 4 && dind >= 4) {
            rollCondition.setAmer(1);
        }
        if (stocks.get(slen - 5).getClose() > list.get(len - 5).getUP() &&
                stocks.get(slen - 4).getClose() > list.get(len - 4).getUP() &&
                stocks.get(slen - 1).getClose() < list.get(len - 1).getUP() && sind < 0) {
            rollCondition.setAmer(-1);
        }
        if (stocks.get(slen - 4).getClose() > list.get(len - 4).getUP() &&
                stocks.get(slen - 1).getClose() < list.get(len - 1).getUP() && sind < 0 && mind < 0 && uind < 0 && dind < 0) {
            rollCondition.setUSAten(1);
        }
        if (stocks.get(slen - 4).getClose() > list.get(len - 4).getMB() &&
                stocks.get(slen - 1).getClose() < list.get(len - 1).getMB() && sind < 0 && mind < 0 && uind < 0 && dind < 0) {
            rollCondition.setUSAten(2);
        }
        if (stocks.get(slen - 5).getClose() < list.get(len - 5).getDN() &&
                stocks.get(slen - 4).getClose() < list.get(len - 4).getDN() &&
                stocks.get(slen - 1).getClose() > list.get(len - 1).getDN() && sind > 0) {
            rollCondition.setUSAten(3);
        }
        if (stocks.get(slen - 6).getClose() < list.get(len - 6).getDN() &&
                stocks.get(slen - 5).getClose() < list.get(len - 5).getDN() &&
                stocks.get(slen - 4).getClose() < list.get(len - 4).getDN() && sind > 0) {
            rollCondition.setUSAten(4);
        }
        return rollCondition;
    }

    /**
     * 第一日用50作为初始k，d值，可能造成后面计算误差，待优化
     *
     * @param id
     * @return
     */
    public List<KDJ> getKDJ(String id) {
        KDJDAO dao = new KDJDAO();
        List<KDJ> list = dao.getList(id);
        return list;
    }

    public List<MACD> getMACD(String id) {
        MACDDAO dao = new MACDDAO();
        List<MACD> list = dao.getList(id);
        return list;
    }

    public List<RSI> getRSI(String id, int n) {
        List<RSI> list = new ArrayList<RSI>();
        List<Stock> stocks = new ArrayList<Stock>();
        stockDAO = new StockDAO();
        try {
            stocks = stockDAO.getDefaultList(id, sdf.parse("2016-06-16"), 61 + n);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        for (int i = 0; i < stocks.size() - n - 1; i++) {
            double[] closes = new double[n + 1];
            for (int j = 0; j < n + 1; j++) {
                closes[j] = stocks.get(i + j).getClose();
            }
            RSI rsi = new RSI(closes, stocks.get(i + n).getDate());
            list.add(rsi);
        }
        return list;
    }

    public List<ROLL> getRoll(String id) {
        List<ROLL> list = new ArrayList<ROLL>();
        List<Stock> stocks = new ArrayList<Stock>();
        stockDAO = new StockDAO();
        try {
            stocks = stockDAO.getDefaultList(id, sdf.parse("2016-06-16"), 58);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        for (int i = 0; i < stocks.size() - 13; i++) {
            double[] closes = new double[13];
            double[] closelist = new double[7];
            double MD;
            double mdsum = 0;
            for (int j = i; j < 13 + i; j++) {
                closes[j - i] = stocks.get(j).getClose();
            }
            for (int j = i + 6; j < i + 13; j++) {
                closelist[j - i - 6] = stocks.get(j).getClose();
            }
            for (int j = 0; j < 7; j++) {
                double inMA;
                double insum = 0;
                for (int k = j; k < 7 + j; k++) {
                    insum = insum + closes[k];
                }
                inMA = insum / 7;
                mdsum = mdsum + (closes[j + 6] - inMA) * (closes[j + 6] - inMA);
            }
            MD = Math.sqrt(mdsum);
            ROLL roll = new ROLL(closelist, MD, stocks.get(i + 14).getDate());
            list.add(roll);
        }
        return list;
    }

    public static void main(String[] args) {
        analysis ana = new analysis();
        ana.getMACD("sh600050");
        ana.getKDJ("sh600050");
    }
}