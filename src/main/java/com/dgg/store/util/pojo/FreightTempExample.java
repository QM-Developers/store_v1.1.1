package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.List;

public class FreightTempExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public FreightTempExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andFreightIdIsNull() {
            addCriterion("freight_id is null");
            return (Criteria) this;
        }

        public Criteria andFreightIdIsNotNull() {
            addCriterion("freight_id is not null");
            return (Criteria) this;
        }

        public Criteria andFreightIdEqualTo(String value) {
            addCriterion("freight_id =", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdNotEqualTo(String value) {
            addCriterion("freight_id <>", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdGreaterThan(String value) {
            addCriterion("freight_id >", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdGreaterThanOrEqualTo(String value) {
            addCriterion("freight_id >=", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdLessThan(String value) {
            addCriterion("freight_id <", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdLessThanOrEqualTo(String value) {
            addCriterion("freight_id <=", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdLike(String value) {
            addCriterion("freight_id like", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdNotLike(String value) {
            addCriterion("freight_id not like", value, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdIn(List<String> values) {
            addCriterion("freight_id in", values, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdNotIn(List<String> values) {
            addCriterion("freight_id not in", values, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdBetween(String value1, String value2) {
            addCriterion("freight_id between", value1, value2, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightIdNotBetween(String value1, String value2) {
            addCriterion("freight_id not between", value1, value2, "freightId");
            return (Criteria) this;
        }

        public Criteria andFreightNameIsNull() {
            addCriterion("freight_name is null");
            return (Criteria) this;
        }

        public Criteria andFreightNameIsNotNull() {
            addCriterion("freight_name is not null");
            return (Criteria) this;
        }

        public Criteria andFreightNameEqualTo(String value) {
            addCriterion("freight_name =", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameNotEqualTo(String value) {
            addCriterion("freight_name <>", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameGreaterThan(String value) {
            addCriterion("freight_name >", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameGreaterThanOrEqualTo(String value) {
            addCriterion("freight_name >=", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameLessThan(String value) {
            addCriterion("freight_name <", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameLessThanOrEqualTo(String value) {
            addCriterion("freight_name <=", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameLike(String value) {
            addCriterion("freight_name like", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameNotLike(String value) {
            addCriterion("freight_name not like", value, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameIn(List<String> values) {
            addCriterion("freight_name in", values, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameNotIn(List<String> values) {
            addCriterion("freight_name not in", values, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameBetween(String value1, String value2) {
            addCriterion("freight_name between", value1, value2, "freightName");
            return (Criteria) this;
        }

        public Criteria andFreightNameNotBetween(String value1, String value2) {
            addCriterion("freight_name not between", value1, value2, "freightName");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceIsNull() {
            addCriterion("weight_allowance is null");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceIsNotNull() {
            addCriterion("weight_allowance is not null");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceEqualTo(Float value) {
            addCriterion("weight_allowance =", value, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceNotEqualTo(Float value) {
            addCriterion("weight_allowance <>", value, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceGreaterThan(Float value) {
            addCriterion("weight_allowance >", value, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceGreaterThanOrEqualTo(Float value) {
            addCriterion("weight_allowance >=", value, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceLessThan(Float value) {
            addCriterion("weight_allowance <", value, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceLessThanOrEqualTo(Float value) {
            addCriterion("weight_allowance <=", value, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceIn(List<Float> values) {
            addCriterion("weight_allowance in", values, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceNotIn(List<Float> values) {
            addCriterion("weight_allowance not in", values, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceBetween(Float value1, Float value2) {
            addCriterion("weight_allowance between", value1, value2, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andWeightAllowanceNotBetween(Float value1, Float value2) {
            addCriterion("weight_allowance not between", value1, value2, "weightAllowance");
            return (Criteria) this;
        }

        public Criteria andStartRangeIsNull() {
            addCriterion("start_range is null");
            return (Criteria) this;
        }

        public Criteria andStartRangeIsNotNull() {
            addCriterion("start_range is not null");
            return (Criteria) this;
        }

        public Criteria andStartRangeEqualTo(Float value) {
            addCriterion("start_range =", value, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeNotEqualTo(Float value) {
            addCriterion("start_range <>", value, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeGreaterThan(Float value) {
            addCriterion("start_range >", value, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeGreaterThanOrEqualTo(Float value) {
            addCriterion("start_range >=", value, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeLessThan(Float value) {
            addCriterion("start_range <", value, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeLessThanOrEqualTo(Float value) {
            addCriterion("start_range <=", value, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeIn(List<Float> values) {
            addCriterion("start_range in", values, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeNotIn(List<Float> values) {
            addCriterion("start_range not in", values, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeBetween(Float value1, Float value2) {
            addCriterion("start_range between", value1, value2, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartRangeNotBetween(Float value1, Float value2) {
            addCriterion("start_range not between", value1, value2, "startRange");
            return (Criteria) this;
        }

        public Criteria andStartPriceIsNull() {
            addCriterion("start_price is null");
            return (Criteria) this;
        }

        public Criteria andStartPriceIsNotNull() {
            addCriterion("start_price is not null");
            return (Criteria) this;
        }

        public Criteria andStartPriceEqualTo(Float value) {
            addCriterion("start_price =", value, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceNotEqualTo(Float value) {
            addCriterion("start_price <>", value, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceGreaterThan(Float value) {
            addCriterion("start_price >", value, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceGreaterThanOrEqualTo(Float value) {
            addCriterion("start_price >=", value, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceLessThan(Float value) {
            addCriterion("start_price <", value, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceLessThanOrEqualTo(Float value) {
            addCriterion("start_price <=", value, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceIn(List<Float> values) {
            addCriterion("start_price in", values, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceNotIn(List<Float> values) {
            addCriterion("start_price not in", values, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceBetween(Float value1, Float value2) {
            addCriterion("start_price between", value1, value2, "startPrice");
            return (Criteria) this;
        }

        public Criteria andStartPriceNotBetween(Float value1, Float value2) {
            addCriterion("start_price not between", value1, value2, "startPrice");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeIsNull() {
            addCriterion("increase_range is null");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeIsNotNull() {
            addCriterion("increase_range is not null");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeEqualTo(Float value) {
            addCriterion("increase_range =", value, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeNotEqualTo(Float value) {
            addCriterion("increase_range <>", value, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeGreaterThan(Float value) {
            addCriterion("increase_range >", value, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeGreaterThanOrEqualTo(Float value) {
            addCriterion("increase_range >=", value, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeLessThan(Float value) {
            addCriterion("increase_range <", value, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeLessThanOrEqualTo(Float value) {
            addCriterion("increase_range <=", value, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeIn(List<Float> values) {
            addCriterion("increase_range in", values, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeNotIn(List<Float> values) {
            addCriterion("increase_range not in", values, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeBetween(Float value1, Float value2) {
            addCriterion("increase_range between", value1, value2, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreaseRangeNotBetween(Float value1, Float value2) {
            addCriterion("increase_range not between", value1, value2, "increaseRange");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceIsNull() {
            addCriterion("increase_price is null");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceIsNotNull() {
            addCriterion("increase_price is not null");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceEqualTo(Float value) {
            addCriterion("increase_price =", value, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceNotEqualTo(Float value) {
            addCriterion("increase_price <>", value, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceGreaterThan(Float value) {
            addCriterion("increase_price >", value, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceGreaterThanOrEqualTo(Float value) {
            addCriterion("increase_price >=", value, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceLessThan(Float value) {
            addCriterion("increase_price <", value, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceLessThanOrEqualTo(Float value) {
            addCriterion("increase_price <=", value, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceIn(List<Float> values) {
            addCriterion("increase_price in", values, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceNotIn(List<Float> values) {
            addCriterion("increase_price not in", values, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceBetween(Float value1, Float value2) {
            addCriterion("increase_price between", value1, value2, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andIncreasePriceNotBetween(Float value1, Float value2) {
            addCriterion("increase_price not between", value1, value2, "increasePrice");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdIsNull() {
            addCriterion("my_team_id is null");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdIsNotNull() {
            addCriterion("my_team_id is not null");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdEqualTo(String value) {
            addCriterion("my_team_id =", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdNotEqualTo(String value) {
            addCriterion("my_team_id <>", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdGreaterThan(String value) {
            addCriterion("my_team_id >", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdGreaterThanOrEqualTo(String value) {
            addCriterion("my_team_id >=", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdLessThan(String value) {
            addCriterion("my_team_id <", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdLessThanOrEqualTo(String value) {
            addCriterion("my_team_id <=", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdLike(String value) {
            addCriterion("my_team_id like", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdNotLike(String value) {
            addCriterion("my_team_id not like", value, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdIn(List<String> values) {
            addCriterion("my_team_id in", values, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdNotIn(List<String> values) {
            addCriterion("my_team_id not in", values, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdBetween(String value1, String value2) {
            addCriterion("my_team_id between", value1, value2, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andMyTeamIdNotBetween(String value1, String value2) {
            addCriterion("my_team_id not between", value1, value2, "myTeamId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}