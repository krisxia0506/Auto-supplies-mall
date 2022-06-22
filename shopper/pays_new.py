# pip install pycrypto
# pip install alipay-sdk-python
# 买家账号：oycmom6988@sandbox.com
# 登录和支付密码：111111


import logging

from alipay.aop.api.AlipayClientConfig import AlipayClientConfig
from alipay.aop.api.DefaultAlipayClient import DefaultAlipayClient
from alipay.aop.api.domain.AlipayTradePagePayModel import AlipayTradePagePayModel
from alipay.aop.api.request.AlipayTradePagePayRequest import AlipayTradePagePayRequest



logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s %(levelname)s %(message)s',
    filemode='a', )
logger = logging.getLogger('')

alipay_public_key_string = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgloxDfUNIBgGo+5BcSBdpOM9hoccBgD8MwqD01m8jLXionC3uAZSOEcuI63SjP+WHGsk6HysY+/bokgMeAbx+vmBcscT39+08WBVFy6YDOusydKWeAzJzeRqISbtRCKkHd2KzzWIHQftEB+R9MZKkXVracDZoBXjRLd/Vw/ACuUSZajPAWmA2ddHl+8BB2qs09AVBeeN6XNRL6zoiXEtc0xRboTAjcqJgtGNyyaucERGT9omxK4JzEL2SqYqY6+vabDGaIh4uT+NS2+F6CS90zIjLWO2JUDQ3BtndHELEyHIzAJ8ru/gVKaIHbYnyxnU8L3ForwXKpQfuzwOzrGyvQIDAQAB
-----END PUBLIC KEY-----
"""
app_private_key_string = """-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAgloxDfUNIBgGo+5BcSBdpOM9hoccBgD8MwqD01m8jLXionC3uAZSOEcuI63SjP+WHGsk6HysY+/bokgMeAbx+vmBcscT39+08WBVFy6YDOusydKWeAzJzeRqISbtRCKkHd2KzzWIHQftEB+R9MZKkXVracDZoBXjRLd/Vw/ACuUSZajPAWmA2ddHl+8BB2qs09AVBeeN6XNRL6zoiXEtc0xRboTAjcqJgtGNyyaucERGT9omxK4JzEL2SqYqY6+vabDGaIh4uT+NS2+F6CS90zIjLWO2JUDQ3BtndHELEyHIzAJ8ru/gVKaIHbYnyxnU8L3ForwXKpQfuzwOzrGyvQIDAQABAoIBADSlAFLGuTpQ+b2TJ9LsY2WIcPy37FVwaGqkwIDHKSMbAiDgrRIhW2tnM/cs6HAReSqZCxrp3yWtZWKw/ngrNedKhUE5rYko7AbgBP2Lz9TICcyoxCRP5eDFcydYdVKjOuzk4H62+/XdkZyFY4kb3FnKtkrLnBjPPi4ufbtHnSPIsn74dXhHTsw6qDs4ATHUj96EbgJHXnwDE8ZUabCEinIRwssDq/RtUL2EYJmArQM/158O88RrT34LiILaPaEd/B7muVQAyK0O3TRaGtEGkVdpnSduvaJLQ2i0wYaNoPsXhxu8q7IAWMMOS7R9Ll/XYSOs0OovNPWDjUB8h4rUHAECgYEA18N8YWEYXwaugqRJ7rbcx+YGYmeBV9Z6WdAfXmjuu+QQI0F//mMzrT7xdaiVqRFyUFGoYThglNRNrjLuPUHx7ZGiVtZO0Xcvo3KfWSsqqCtZ5XdWauCY7kFCzYI8ozkJ72cz6iuHjPO0jcJWtDmiH6EnUTYBxnBhq4YIsGhDMEECgYEAmqkvrHzLKepH3sb/Dm2XlqvmIOSHFr4dOB+tQ4MQyaCaphAsCXfCkRrusq0iqGc+9OGx6x7S5LnLqsNj5AvY8WwC545CMmbb7uwz4eKHnzY6O5yigRLREliwCNVQEn+sgbu902gEDspNaQRavhJmBKtqJqvJ1m1HqsICMhu6Y30CgYEAt2C6EbmIERuIrhgbjft04aCqxG/cCl+LVVIBlyfv31kSLiS5N+fwP8pDRhCmQi9FzOXaCeb0jwlxjCBVQ1MM3zDrnIpAKt71aiE9NXfupUdS/CfVFrkUwUpOEIQkLUWJICPCh7+/URi/18vYDQz+sYsx81/HWnShTjp4oBW9JQECgYA2C0radl00D2b/5P+5lfgzsWvgMJs4CkUBmKgeAE28dz+zKdGJmWzG8edZToDe4f0w6zEV3RaK0JXn3REp3i335ut46NAe9qyB584Vb+g+bV+Z9xkeC2o9g/o3i/rIDA9G4kjp9937IRw9x0TCSIGXviKA0uTb5iH1/Idx5RiTrQKBgFM1s9b5V5jrqSCsEVVXpy58Q/d+Sw8Ys3ZWKQlbmYehwrppoPZuIPbzgXLTPfEbjRFQ5f/6eVhMXjhiT7dImolY/GAT7ro7vnSRqCcJhO7GTbqMZYOAgqa2M5d22NEa0l8nZv2vSmNX1/VlSGm6vymkRejVA/EB5gmsO40sxl/X
-----END RSA PRIVATE KEY-----
"""

alipay_client_config = AlipayClientConfig()
alipay_client_config.server_url = 'https://openapi.alipaydev.com/gateway.do'
alipay_client_config.app_id = '2021000121601555'
alipay_client_config.app_private_key = app_private_key_string
alipay_client_config.alipay_public_key = alipay_public_key_string
client = DefaultAlipayClient(alipay_client_config=alipay_client_config, logger=logger)


def get_pay(out_trade_no, total_amount, return_url):
    model = AlipayTradePagePayModel()
    model.out_trade_no = out_trade_no
    model.total_amount = str(total_amount)
    model.subject = "测试"
    model.body = "支付宝测试"
    model.product_code = "FAST_INSTANT_TRADE_PAY"

    request = AlipayTradePagePayRequest(biz_model=model)

    request.notify_url = return_url + '?t=' + out_trade_no
    request.return_url = return_url + '?t=' + out_trade_no
    response = client.page_execute(request, http_method="GET")


    return response
