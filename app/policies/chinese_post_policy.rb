class ChinesePostPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin?
  end

  def show?
    user.present?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end
end