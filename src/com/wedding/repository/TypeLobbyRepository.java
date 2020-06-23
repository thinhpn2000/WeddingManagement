package com.wedding.repository;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wedding.models.TypeLobby;
import com.wedding.utils.APIConstant;

public class TypeLobbyRepository {
	Gson gson = new Gson();
	public List<TypeLobby> getAll() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet req = new HttpGet(APIConstant.API_typelobby_get);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity, "UTF-8");
			return convertJSONToListTypeLobby(json);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<TypeLobby> convertJSONToListTypeLobby(String json) {
		Type typeList = new TypeToken <ArrayList<TypeLobby>>() {}.getType();
		return gson.fromJson(json, typeList);
	}
}
