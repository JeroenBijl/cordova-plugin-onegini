package com.onegini.model;

import com.google.gson.annotations.SerializedName;
import com.onegini.mobile.sdk.android.library.model.OneginiClientConfigModel;


public class ConfigModel implements OneginiClientConfigModel {
    @SerializedName("shouldGetIdToken")
    private boolean shouldGetIdToken;
    @SerializedName("kOGAppIdentifier")
    private String appIdentifier;
    @SerializedName("kOGAppPlatform")
    private String appPlatform;
    @SerializedName("kOGAppScheme")
    private String appScheme;
    //@SerializedName("appSecret")
    private String appSecret = "1234";
    @SerializedName("kOGAppVersion")
    private String appVersion;
    @SerializedName("kAppBaseURL")
    private String baseUrl;
    @SerializedName("kOGMaxPinFailures")
    private int maxPinFailures;
    @SerializedName("kOGResourceBaseURL")
    private String resourceBaseUrl;
    @SerializedName("kOGShouldConfirmNewPin")
    private boolean shouldConfirmNewPin;
    @SerializedName("kOGShouldDirectlyShowPushMessage")
    private boolean shouldDirectlyShowPushMessage;
   
    private int certificatePinningKeyStore;
    @SerializedName("deviceName")
    private String deviceName;
    
    private  String keyStoreHash;

    @Override
    public String getAppIdentifier() {
        return appIdentifier;
    }

    @Override
    public String getAppPlatform() {
        return appPlatform;
    }

    @Override
    public String getAppScheme() {
        return appScheme;
    }

    @Override
    public String getAppSecret() {
        return appSecret;
    }

    @Override
    public String getAppVersion() {
        return appVersion;
    }

    @Override
    public String getBaseUrl() {
        return baseUrl;
    }

    @Override
    public int getMaxPinFailures() {
        return maxPinFailures;
    }

    @Override
    public String getResourceBaseUrl() {
        return resourceBaseUrl;
    }

    @Override
    public boolean shouldConfirmNewPin() {
        return shouldConfirmNewPin;
    }

    @Override
    public boolean shouldDirectlyShowPushMessage() {
        return shouldDirectlyShowPushMessage;
    }

    @Override
    public int getCertificatePinningKeyStore() {
        return certificatePinningKeyStore;
    }

    public void setCertificatePinningKeyStore(int certificatePinningKeyStore) {
        this.certificatePinningKeyStore = certificatePinningKeyStore;
    }

    @Override
    public String getKeyStoreHash() {
        return keyStoreHash;
    }

    public void setKeyStoreHash(String keyStoreHash) {
        this.keyStoreHash = keyStoreHash;
    }

    @Override
    public String getDeviceName() {
        return deviceName;
    }

    @Override
    public boolean shouldGetIdToken() {
        return shouldGetIdToken;
    }

    @Override
    public boolean shouldStoreCookies() {
        return true;
    }
}
