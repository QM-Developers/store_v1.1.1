package com.dgg.store.util.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RepertoryApplyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;
    private int pageNum;
    private Integer pageSize;

    public RepertoryApplyExample() {
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

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }

    public Integer getPageSize()
    {
        return pageSize;
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

        public Criteria andApplyIdIsNull() {
            addCriterion("apply_id is null");
            return (Criteria) this;
        }

        public Criteria andApplyIdIsNotNull() {
            addCriterion("apply_id is not null");
            return (Criteria) this;
        }

        public Criteria andApplyIdEqualTo(String value) {
            addCriterion("apply_id =", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotEqualTo(String value) {
            addCriterion("apply_id <>", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdGreaterThan(String value) {
            addCriterion("apply_id >", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdGreaterThanOrEqualTo(String value) {
            addCriterion("apply_id >=", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdLessThan(String value) {
            addCriterion("apply_id <", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdLessThanOrEqualTo(String value) {
            addCriterion("apply_id <=", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdLike(String value) {
            addCriterion("apply_id like", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotLike(String value) {
            addCriterion("apply_id not like", value, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdIn(List<String> values) {
            addCriterion("apply_id in", values, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotIn(List<String> values) {
            addCriterion("apply_id not in", values, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdBetween(String value1, String value2) {
            addCriterion("apply_id between", value1, value2, "applyId");
            return (Criteria) this;
        }

        public Criteria andApplyIdNotBetween(String value1, String value2) {
            addCriterion("apply_id not between", value1, value2, "applyId");
            return (Criteria) this;
        }

        public Criteria andBranchIdIsNull() {
            addCriterion("branch_id is null");
            return (Criteria) this;
        }

        public Criteria andBranchIdIsNotNull() {
            addCriterion("branch_id is not null");
            return (Criteria) this;
        }

        public Criteria andBranchIdEqualTo(String value) {
            addCriterion("branch_id =", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdNotEqualTo(String value) {
            addCriterion("branch_id <>", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdGreaterThan(String value) {
            addCriterion("branch_id >", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdGreaterThanOrEqualTo(String value) {
            addCriterion("branch_id >=", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdLessThan(String value) {
            addCriterion("branch_id <", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdLessThanOrEqualTo(String value) {
            addCriterion("branch_id <=", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdLike(String value) {
            addCriterion("branch_id like", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdNotLike(String value) {
            addCriterion("branch_id not like", value, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdIn(List<String> values) {
            addCriterion("branch_id in", values, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdNotIn(List<String> values) {
            addCriterion("branch_id not in", values, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdBetween(String value1, String value2) {
            addCriterion("branch_id between", value1, value2, "branchId");
            return (Criteria) this;
        }

        public Criteria andBranchIdNotBetween(String value1, String value2) {
            addCriterion("branch_id not between", value1, value2, "branchId");
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

        public Criteria andBranchNameIsNull() {
            addCriterion("branch_name is null");
            return (Criteria) this;
        }

        public Criteria andBranchNameIsNotNull() {
            addCriterion("branch_name is not null");
            return (Criteria) this;
        }

        public Criteria andBranchNameEqualTo(String value) {
            addCriterion("branch_name =", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameNotEqualTo(String value) {
            addCriterion("branch_name <>", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameGreaterThan(String value) {
            addCriterion("branch_name >", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameGreaterThanOrEqualTo(String value) {
            addCriterion("branch_name >=", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameLessThan(String value) {
            addCriterion("branch_name <", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameLessThanOrEqualTo(String value) {
            addCriterion("branch_name <=", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameLike(String value) {
            addCriterion("branch_name like", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameNotLike(String value) {
            addCriterion("branch_name not like", value, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameIn(List<String> values) {
            addCriterion("branch_name in", values, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameNotIn(List<String> values) {
            addCriterion("branch_name not in", values, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameBetween(String value1, String value2) {
            addCriterion("branch_name between", value1, value2, "branchName");
            return (Criteria) this;
        }

        public Criteria andBranchNameNotBetween(String value1, String value2) {
            addCriterion("branch_name not between", value1, value2, "branchName");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateIsNull() {
            addCriterion("accept_date is null");
            return (Criteria) this;
        }

        public Criteria andAcceptDateIsNotNull() {
            addCriterion("accept_date is not null");
            return (Criteria) this;
        }

        public Criteria andAcceptDateEqualTo(Date value) {
            addCriterion("accept_date =", value, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateNotEqualTo(Date value) {
            addCriterion("accept_date <>", value, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateGreaterThan(Date value) {
            addCriterion("accept_date >", value, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateGreaterThanOrEqualTo(Date value) {
            addCriterion("accept_date >=", value, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateLessThan(Date value) {
            addCriterion("accept_date <", value, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateLessThanOrEqualTo(Date value) {
            addCriterion("accept_date <=", value, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateIn(List<Date> values) {
            addCriterion("accept_date in", values, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateNotIn(List<Date> values) {
            addCriterion("accept_date not in", values, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateBetween(Date value1, Date value2) {
            addCriterion("accept_date between", value1, value2, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andAcceptDateNotBetween(Date value1, Date value2) {
            addCriterion("accept_date not between", value1, value2, "acceptDate");
            return (Criteria) this;
        }

        public Criteria andProposerIdIsNull() {
            addCriterion("proposer_id is null");
            return (Criteria) this;
        }

        public Criteria andProposerIdIsNotNull() {
            addCriterion("proposer_id is not null");
            return (Criteria) this;
        }

        public Criteria andProposerIdEqualTo(String value) {
            addCriterion("proposer_id =", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotEqualTo(String value) {
            addCriterion("proposer_id <>", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdGreaterThan(String value) {
            addCriterion("proposer_id >", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdGreaterThanOrEqualTo(String value) {
            addCriterion("proposer_id >=", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdLessThan(String value) {
            addCriterion("proposer_id <", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdLessThanOrEqualTo(String value) {
            addCriterion("proposer_id <=", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdLike(String value) {
            addCriterion("proposer_id like", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotLike(String value) {
            addCriterion("proposer_id not like", value, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdIn(List<String> values) {
            addCriterion("proposer_id in", values, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotIn(List<String> values) {
            addCriterion("proposer_id not in", values, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdBetween(String value1, String value2) {
            addCriterion("proposer_id between", value1, value2, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerIdNotBetween(String value1, String value2) {
            addCriterion("proposer_id not between", value1, value2, "proposerId");
            return (Criteria) this;
        }

        public Criteria andProposerNameIsNull() {
            addCriterion("proposer_name is null");
            return (Criteria) this;
        }

        public Criteria andProposerNameIsNotNull() {
            addCriterion("proposer_name is not null");
            return (Criteria) this;
        }

        public Criteria andProposerNameEqualTo(String value) {
            addCriterion("proposer_name =", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotEqualTo(String value) {
            addCriterion("proposer_name <>", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameGreaterThan(String value) {
            addCriterion("proposer_name >", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameGreaterThanOrEqualTo(String value) {
            addCriterion("proposer_name >=", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameLessThan(String value) {
            addCriterion("proposer_name <", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameLessThanOrEqualTo(String value) {
            addCriterion("proposer_name <=", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameLike(String value) {
            addCriterion("proposer_name like", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotLike(String value) {
            addCriterion("proposer_name not like", value, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameIn(List<String> values) {
            addCriterion("proposer_name in", values, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotIn(List<String> values) {
            addCriterion("proposer_name not in", values, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameBetween(String value1, String value2) {
            addCriterion("proposer_name between", value1, value2, "proposerName");
            return (Criteria) this;
        }

        public Criteria andProposerNameNotBetween(String value1, String value2) {
            addCriterion("proposer_name not between", value1, value2, "proposerName");
            return (Criteria) this;
        }

        public Criteria andApproverIdIsNull() {
            addCriterion("approver_id is null");
            return (Criteria) this;
        }

        public Criteria andApproverIdIsNotNull() {
            addCriterion("approver_id is not null");
            return (Criteria) this;
        }

        public Criteria andApproverIdEqualTo(String value) {
            addCriterion("approver_id =", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdNotEqualTo(String value) {
            addCriterion("approver_id <>", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdGreaterThan(String value) {
            addCriterion("approver_id >", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdGreaterThanOrEqualTo(String value) {
            addCriterion("approver_id >=", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdLessThan(String value) {
            addCriterion("approver_id <", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdLessThanOrEqualTo(String value) {
            addCriterion("approver_id <=", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdLike(String value) {
            addCriterion("approver_id like", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdNotLike(String value) {
            addCriterion("approver_id not like", value, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdIn(List<String> values) {
            addCriterion("approver_id in", values, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdNotIn(List<String> values) {
            addCriterion("approver_id not in", values, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdBetween(String value1, String value2) {
            addCriterion("approver_id between", value1, value2, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverIdNotBetween(String value1, String value2) {
            addCriterion("approver_id not between", value1, value2, "approverId");
            return (Criteria) this;
        }

        public Criteria andApproverNameIsNull() {
            addCriterion("approver_name is null");
            return (Criteria) this;
        }

        public Criteria andApproverNameIsNotNull() {
            addCriterion("approver_name is not null");
            return (Criteria) this;
        }

        public Criteria andApproverNameEqualTo(String value) {
            addCriterion("approver_name =", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameNotEqualTo(String value) {
            addCriterion("approver_name <>", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameGreaterThan(String value) {
            addCriterion("approver_name >", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameGreaterThanOrEqualTo(String value) {
            addCriterion("approver_name >=", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameLessThan(String value) {
            addCriterion("approver_name <", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameLessThanOrEqualTo(String value) {
            addCriterion("approver_name <=", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameLike(String value) {
            addCriterion("approver_name like", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameNotLike(String value) {
            addCriterion("approver_name not like", value, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameIn(List<String> values) {
            addCriterion("approver_name in", values, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameNotIn(List<String> values) {
            addCriterion("approver_name not in", values, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameBetween(String value1, String value2) {
            addCriterion("approver_name between", value1, value2, "approverName");
            return (Criteria) this;
        }

        public Criteria andApproverNameNotBetween(String value1, String value2) {
            addCriterion("approver_name not between", value1, value2, "approverName");
            return (Criteria) this;
        }

        public Criteria andApplyStatusIsNull() {
            addCriterion("apply_status is null");
            return (Criteria) this;
        }

        public Criteria andApplyStatusIsNotNull() {
            addCriterion("apply_status is not null");
            return (Criteria) this;
        }

        public Criteria andApplyStatusEqualTo(Byte value) {
            addCriterion("apply_status =", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotEqualTo(Byte value) {
            addCriterion("apply_status <>", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusGreaterThan(Byte value) {
            addCriterion("apply_status >", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusGreaterThanOrEqualTo(Byte value) {
            addCriterion("apply_status >=", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusLessThan(Byte value) {
            addCriterion("apply_status <", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusLessThanOrEqualTo(Byte value) {
            addCriterion("apply_status <=", value, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusIn(List<Byte> values) {
            addCriterion("apply_status in", values, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotIn(List<Byte> values) {
            addCriterion("apply_status not in", values, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusBetween(Byte value1, Byte value2) {
            addCriterion("apply_status between", value1, value2, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyStatusNotBetween(Byte value1, Byte value2) {
            addCriterion("apply_status not between", value1, value2, "applyStatus");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkIsNull() {
            addCriterion("apply_remark is null");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkIsNotNull() {
            addCriterion("apply_remark is not null");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkEqualTo(String value) {
            addCriterion("apply_remark =", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkNotEqualTo(String value) {
            addCriterion("apply_remark <>", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkGreaterThan(String value) {
            addCriterion("apply_remark >", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("apply_remark >=", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkLessThan(String value) {
            addCriterion("apply_remark <", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkLessThanOrEqualTo(String value) {
            addCriterion("apply_remark <=", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkLike(String value) {
            addCriterion("apply_remark like", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkNotLike(String value) {
            addCriterion("apply_remark not like", value, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkIn(List<String> values) {
            addCriterion("apply_remark in", values, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkNotIn(List<String> values) {
            addCriterion("apply_remark not in", values, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkBetween(String value1, String value2) {
            addCriterion("apply_remark between", value1, value2, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyRemarkNotBetween(String value1, String value2) {
            addCriterion("apply_remark not between", value1, value2, "applyRemark");
            return (Criteria) this;
        }

        public Criteria andApplyCodeIsNull() {
            addCriterion("apply_code is null");
            return (Criteria) this;
        }

        public Criteria andApplyCodeIsNotNull() {
            addCriterion("apply_code is not null");
            return (Criteria) this;
        }

        public Criteria andApplyCodeEqualTo(String value) {
            addCriterion("apply_code =", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeNotEqualTo(String value) {
            addCriterion("apply_code <>", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeGreaterThan(String value) {
            addCriterion("apply_code >", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeGreaterThanOrEqualTo(String value) {
            addCriterion("apply_code >=", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeLessThan(String value) {
            addCriterion("apply_code <", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeLessThanOrEqualTo(String value) {
            addCriterion("apply_code <=", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeLike(String value) {
            addCriterion("apply_code like", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeNotLike(String value) {
            addCriterion("apply_code not like", value, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeIn(List<String> values) {
            addCriterion("apply_code in", values, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeNotIn(List<String> values) {
            addCriterion("apply_code not in", values, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeBetween(String value1, String value2) {
            addCriterion("apply_code between", value1, value2, "applyCode");
            return (Criteria) this;
        }

        public Criteria andApplyCodeNotBetween(String value1, String value2) {
            addCriterion("apply_code not between", value1, value2, "applyCode");
            return (Criteria) this;
        }

        public Criteria andReceiveDateIsNull() {
            addCriterion("receive_date is null");
            return (Criteria) this;
        }

        public Criteria andReceiveDateIsNotNull() {
            addCriterion("receive_date is not null");
            return (Criteria) this;
        }

        public Criteria andReceiveDateEqualTo(Date value) {
            addCriterion("receive_date =", value, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateNotEqualTo(Date value) {
            addCriterion("receive_date <>", value, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateGreaterThan(Date value) {
            addCriterion("receive_date >", value, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateGreaterThanOrEqualTo(Date value) {
            addCriterion("receive_date >=", value, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateLessThan(Date value) {
            addCriterion("receive_date <", value, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateLessThanOrEqualTo(Date value) {
            addCriterion("receive_date <=", value, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateIn(List<Date> values) {
            addCriterion("receive_date in", values, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateNotIn(List<Date> values) {
            addCriterion("receive_date not in", values, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateBetween(Date value1, Date value2) {
            addCriterion("receive_date between", value1, value2, "receiveDate");
            return (Criteria) this;
        }

        public Criteria andReceiveDateNotBetween(Date value1, Date value2) {
            addCriterion("receive_date not between", value1, value2, "receiveDate");
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