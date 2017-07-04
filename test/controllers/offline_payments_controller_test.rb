require 'test_helper'

class OfflinePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offline_payment = offline_payments(:one)
  end

  test "should get index" do
    get offline_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_offline_payment_url
    assert_response :success
  end

  test "should create offline_payment" do
    assert_difference('OfflinePayment.count') do
      post offline_payments_url, params: { offline_payment: { amount: @offline_payment.amount, bank_name: @offline_payment.bank_name, check_number: @offline_payment.check_number, customer_id: @offline_payment.customer_id, date: @offline_payment.date, date_on_check: @offline_payment.date_on_check, plan_id: @offline_payment.plan_id } }
    end

    assert_redirected_to offline_payment_url(OfflinePayment.last)
  end

  test "should show offline_payment" do
    get offline_payment_url(@offline_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_offline_payment_url(@offline_payment)
    assert_response :success
  end

  test "should update offline_payment" do
    patch offline_payment_url(@offline_payment), params: { offline_payment: { amount: @offline_payment.amount, bank_name: @offline_payment.bank_name, check_number: @offline_payment.check_number, customer_id: @offline_payment.customer_id, date: @offline_payment.date, date_on_check: @offline_payment.date_on_check, plan_id: @offline_payment.plan_id } }
    assert_redirected_to offline_payment_url(@offline_payment)
  end

  test "should destroy offline_payment" do
    assert_difference('OfflinePayment.count', -1) do
      delete offline_payment_url(@offline_payment)
    end

    assert_redirected_to offline_payments_url
  end
end
