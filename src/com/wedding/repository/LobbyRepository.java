package com.wedding.repository;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wedding.models.Lobby;
import com.wedding.utils.APIConstant;

public class LobbyRepository {
	Gson gson = new Gson();

	public List<Lobby> getAll() {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet req = new HttpGet(APIConstant.API_lobby_get);
		try {
			CloseableHttpResponse res = httpClient.execute(req);
			HttpEntity entity = res.getEntity();
			String json = EntityUtils.toString(entity);
			return convertJSONToListLobby(json);

		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

	public void addLobby(Lobby sanh) {
		HttpPost req = new HttpPost(APIConstant.API_lobby_add);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		List<NameValuePair> urlParamaters = new ArrayList<>();
		urlParamaters.add(new BasicNameValuePair("lobbyName", sanh.getLobbyName()));
		urlParamaters.add(new BasicNameValuePair("lobbyTypeID", Integer.toString(sanh.getLobbyTypeID())));
		urlParamaters.add(new BasicNameValuePair("maxTable", Integer.toString(sanh.getMaxTable())));
		try {
			req.setEntity(new UrlEncodedFormEntity(urlParamaters, "UTF-8"));
			CloseableHttpResponse res = httpClient.execute(req);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delele(int id) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpDelete req = new HttpDelete(APIConstant.API_lobby_delete + "?id=" + id);

		try {
			CloseableHttpResponse res = httpClient.execute(req);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void update(Lobby sanh) {
		String json = convertLobbyToJSON(sanh);
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPut req = new HttpPut(APIConstant.API_lobby_update);
		req.setEntity(new StringEntity(json, "UTF-8"));
		try {
			CloseableHttpResponse res = httpClient.execute(req);

			HttpEntity respEntity = res.getEntity();
			if (respEntity != null) {
				String content = EntityUtils.toString(respEntity);
				System.out.println(content);
			}
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Lobby> convertJSONToListLobby(String json) {
		Type typeListLobby = new TypeToken<ArrayList<Lobby>>() {
		}.getType();
		return gson.fromJson(json, typeListLobby);
	}

	public String convertLobbyToJSON(Lobby lobby) {
		return gson.toJson(lobby);
	}
}
