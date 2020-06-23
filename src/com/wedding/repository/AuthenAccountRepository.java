package com.wedding.repository;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.wedding.dto.UserDTO;
import com.wedding.utils.APIConstant;

public class AuthenAccountRepository {
	
	private Gson gson = new Gson();

	public UserDTO authenLogin(String username, String password) {
		HttpPost req = new HttpPost(APIConstant.API_login);
		List<NameValuePair> urlParamaters = new ArrayList<>();
		urlParamaters.add(new BasicNameValuePair("username", username));
		urlParamaters.add(new BasicNameValuePair("password", password));
		try {
			req.setEntity(new UrlEncodedFormEntity(urlParamaters,"UTF-8"));
			CloseableHttpClient httpClient = HttpClients.createDefault();
			// execute post method
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			//res.getStatusLine()
			String result = EntityUtils.toString(entity);
			if(result.equals('"' + "Login Failed" + '"'))
				return null;
			else {
				UserDTO user = convertJSONToUserDto(result);
				return user;
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated castch block
			e.printStackTrace();
		}
		return null;
	}
	public UserDTO convertJSONToUserDto(String JSON) {
		return gson.fromJson(JSON, UserDTO.class);
	}
}



