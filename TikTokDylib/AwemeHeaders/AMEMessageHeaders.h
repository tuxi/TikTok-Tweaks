//
// AMEMessageHeaders.h
// Aweme
//
// Created by xiaoyuan on 2020/4/26.
// Copyright © 2020 enba. All rights reserved.
//

#ifndef AMEMessageHeaders_h
#define AMEMessageHeaders_h

typedef id CDUnknownBlockType;

@protocol AWEIMConversationParticipantDataControllerDelegate <NSObject>
- (void)participantsDataSourceDidUpdate;
@end

@class AWEIMPinYinSearchObject, NSNumber, NSString, NSURL;

@interface GYModelObject : NSObject

@end

@interface AWEIMUser : GYModelObject
{
    _Bool _isToCommerceUser;
    _Bool _isBlocked;
    NSString *_nickname;
    NSString *_alias;
    NSString *_aliasPinYin;
    NSString *_nicknamePinYin;
    NSString *_contactName;
    NSString *_contactNamePinYin;
    NSString *_uid;
    long long _followStatus;
    NSString *_signature;
    long long _latestChatTimestamp;
    NSString *_requestID;
    NSString *_customID;
    NSString *_customVerifyInfo;
    unsigned long long _verificationType;
    NSString *_enterpriseVerifyInfo;
    NSString *_shortID;
    NSNumber *_commerceUserLevel;
    NSString *_secUserID;
    NSString *_recommendReason;
    NSString *_url1;
    NSString *_url2;
    NSString *_url3;
}

+ (id)persistentProperties;
+ (id)primaryKey;
+ (id)tableName;
+ (id)dbName;
+ (id)createUserWithJsonDictionary:(id)arg1;
@property(copy, nonatomic) NSString *url3; // @synthesize url3=_url3;
@property(copy, nonatomic) NSString *url2; // @synthesize url2=_url2;
@property(copy, nonatomic) NSString *url1; // @synthesize url1=_url1;
@property(nonatomic) _Bool isBlocked; // @synthesize isBlocked=_isBlocked;
@property(copy, nonatomic) NSString *recommendReason; // @synthesize recommendReason=_recommendReason;
@property(copy, nonatomic) NSString *secUserID; // @synthesize secUserID=_secUserID;
@property(nonatomic) _Bool isToCommerceUser; // @synthesize isToCommerceUser=_isToCommerceUser;
@property(retain, nonatomic) NSNumber *commerceUserLevel; // @synthesize commerceUserLevel=_commerceUserLevel;
@property(copy, nonatomic) NSString *shortID; // @synthesize shortID=_shortID;
@property(copy, nonatomic) NSString *enterpriseVerifyInfo; // @synthesize enterpriseVerifyInfo=_enterpriseVerifyInfo;
@property(nonatomic) unsigned long long verificationType; // @synthesize verificationType=_verificationType;
@property(copy, nonatomic) NSString *customVerifyInfo; // @synthesize customVerifyInfo=_customVerifyInfo;
@property(copy, nonatomic) NSString *customID; // @synthesize customID=_customID;
@property(copy, nonatomic) NSString *requestID; // @synthesize requestID=_requestID;
@property(nonatomic) long long latestChatTimestamp; // @synthesize latestChatTimestamp=_latestChatTimestamp;
@property(copy, nonatomic) NSString *signature; // @synthesize signature=_signature;
@property(nonatomic) long long followStatus; // @synthesize followStatus=_followStatus;
@property(copy, nonatomic) NSString *uid; // @synthesize uid=_uid;
@property(readonly, copy) NSString *contactNamePinYin; // @synthesize contactNamePinYin=_contactNamePinYin;
@property(copy) NSString *contactName; // @synthesize contactName=_contactName;
@property(readonly, copy) NSString *aliasPinYin; // @synthesize aliasPinYin=_aliasPinYin;
@property(readonly, copy) NSString *nicknamePinYin; // @synthesize nicknamePinYin=_nicknamePinYin;
@property(copy) NSString *nickname; // @synthesize nickname=_nickname;
@property(copy) NSString *alias; // @synthesize alias=_alias;
- (_Bool)string:(id)arg1 equalToString:(id)arg2;
- (_Bool)isCommerceProfile;
- (_Bool)isCompanyProfile;
- (void)clearUserDisplayInfo;
@property(copy, nonatomic) NSURL *avatarURL; // @dynamic avatarURL;
- (unsigned long long)hash;
- (_Bool)isEqual:(id)arg1;
- (id)verifiedIconName;
- (_Bool)isPersonalVerifiedEffectArtist;
- (_Bool)isVerifiedEnterprise;
- (_Bool)isVerifiedMusician;
- (_Bool)isVerifiedUser;
- (id)p_getURLDict;
- (void)configAvatarURLWithArray:(id)arg1;
- (id)fakeUserID;
- (id)displayName;
- (id)getAwemeUser;
- (id)getStrangerUser;
- (id)initWithStrangerUser:(id)arg1;
- (id)initWithAweUser:(id)arg1;
- (void)awe_assignIMUser:(id)arg1;
@property struct _NSRange matchRange;
@property unsigned long long searchUserType;
@property(copy, nonatomic) NSString *highlightWord; // @dynamic highlightWord;
@property(nonatomic) struct _NSRange attributeNicknameRange; // @dynamic attributeNicknameRange;
@property(readonly, nonatomic) AWEIMPinYinSearchObject *contactNamePinYinSearchObj;
@property(readonly, nonatomic) AWEIMPinYinSearchObject *nicknamePinYinSearchObj;
@property(readonly, nonatomic) AWEIMPinYinSearchObject *aliasPinYinSearchObj;

@end

@protocol AWEIMMessageConversationDelegate <NSObject>
- (void)participantsDidUpdate;
@end

@class NSNumber, NSString, NSURL;

@interface AWEIMUserViewModel : NSObject
{
    _Bool _isToCommerceUser;
    NSString *_uid;
    NSString *_nickname;
    NSString *_alias;
    NSURL *_avatarURL;
    long long _followStatus;
    NSString *_signature;
    long long _latestChatTimestamp;
    NSString *_requestID;
    NSString *_customID;
    NSString *_customVerifyInfo;
    unsigned long long _verificationType;
    NSString *_enterpriseVerifyInfo;
    NSString *_shortID;
    NSNumber *_commerceUserLevel;
    NSString *_aliasPinYin;
    NSString *_nicknamePinYin;
    NSString *_secUserID;
    NSString *_recommendReason;
    NSString *_contactName;
    NSString *_contactNamePinYin;
    NSString *_displayName;
}

@property(retain, nonatomic) NSString *displayName; // @synthesize displayName=_displayName;
@property(retain, nonatomic) NSString *contactNamePinYin; // @synthesize contactNamePinYin=_contactNamePinYin;
@property(retain, nonatomic) NSString *contactName; // @synthesize contactName=_contactName;
@property(retain, nonatomic) NSString *recommendReason; // @synthesize recommendReason=_recommendReason;
@property(retain, nonatomic) NSString *secUserID; // @synthesize secUserID=_secUserID;
@property(retain, nonatomic) NSString *nicknamePinYin; // @synthesize nicknamePinYin=_nicknamePinYin;
@property(retain, nonatomic) NSString *aliasPinYin; // @synthesize aliasPinYin=_aliasPinYin;
@property(nonatomic) _Bool isToCommerceUser; // @synthesize isToCommerceUser=_isToCommerceUser;
@property(retain, nonatomic) NSNumber *commerceUserLevel; // @synthesize commerceUserLevel=_commerceUserLevel;
@property(retain, nonatomic) NSString *shortID; // @synthesize shortID=_shortID;
@property(retain, nonatomic) NSString *enterpriseVerifyInfo; // @synthesize enterpriseVerifyInfo=_enterpriseVerifyInfo;
@property(nonatomic) unsigned long long verificationType; // @synthesize verificationType=_verificationType;
@property(retain, nonatomic) NSString *customVerifyInfo; // @synthesize customVerifyInfo=_customVerifyInfo;
@property(retain, nonatomic) NSString *customID; // @synthesize customID=_customID;
@property(retain, nonatomic) NSString *requestID; // @synthesize requestID=_requestID;
@property(readonly, nonatomic) long long latestChatTimestamp; // @synthesize latestChatTimestamp=_latestChatTimestamp;
@property(retain, nonatomic) NSString *signature; // @synthesize signature=_signature;
@property(nonatomic) long long followStatus; // @synthesize followStatus=_followStatus;
@property(retain, nonatomic) NSURL *avatarURL; // @synthesize avatarURL=_avatarURL;
@property(retain, nonatomic) NSString *alias; // @synthesize alias=_alias;
@property(retain, nonatomic) NSString *nickname; // @synthesize nickname=_nickname;
@property(retain, nonatomic) NSString *uid; // @synthesize uid=_uid;
- (void)p_updateDisplayName;
- (void)refresh;
- (_Bool)isCommerceProfile;
- (_Bool)isCompanyProfile;
- (void)clearUserDisplayInfo;
- (id)verifiedIconName;
- (_Bool)isPersonalVerifiedEffectArtist;
- (_Bool)isVerifiedEnterprise;
- (_Bool)isVerifiedMusician;
- (_Bool)isVerifiedUser;
- (id)fakeUserID;
- (void)assignWithUser:(id)arg1;
- (id)initWithUserID:(id)arg1 secUserID:(id)arg2;

@end

@interface AWEIMMessageConversation : NSObject <AWEIMConversationParticipantDataControllerDelegate>
{
    NSString *_peerSecUserID;
    _Bool _isCurrentUserAParticipant;
    _Bool _mute;
    _Bool _stickOnTop;
    _Bool _isNameChanged;
    _Bool _isAuthorService;
    NSString *_conversationID;
    unsigned long long _type;
    NSString *_peerUserID;
    AWEIMUser *_peerUser;
//    AWEIMConversationParticipantDataController *_participantDataController;
    NSString *_ownerID;
    NSString *_name;
    NSString *_avatar;
    unsigned long long _participantsCount;
    NSString *_notice;
    id <AWEIMMessageConversationDelegate> _delegate;
//    TIMOConversation *_con;
    AWEIMUserViewModel *_peerUserViewModel;
}

@property(retain, nonatomic) AWEIMUserViewModel *peerUserViewModel; // @synthesize peerUserViewModel=_peerUserViewModel;
//@property(retain, nonatomic) TIMOConversation *con; // @synthesize con=_con;
@property(nonatomic) __weak id <AWEIMMessageConversationDelegate> delegate; // @synthesize delegate=_delegate;
@property(nonatomic) _Bool isAuthorService; // @synthesize isAuthorService=_isAuthorService;
@property(copy, nonatomic) NSString *notice; // @synthesize notice=_notice;
@property(nonatomic) _Bool isNameChanged; // @synthesize isNameChanged=_isNameChanged;
@property(nonatomic) _Bool stickOnTop; // @synthesize stickOnTop=_stickOnTop;
@property(nonatomic) _Bool mute; // @synthesize mute=_mute;
@property(nonatomic) _Bool isCurrentUserAParticipant; // @synthesize isCurrentUserAParticipant=_isCurrentUserAParticipant;
@property(nonatomic) unsigned long long participantsCount; // @synthesize participantsCount=_participantsCount;
@property(retain, nonatomic) NSString *avatar; // @synthesize avatar=_avatar;
@property(retain, nonatomic) NSString *name; // @synthesize name=_name;
@property(retain, nonatomic) NSString *ownerID; // @synthesize ownerID=_ownerID;
//@property(retain, nonatomic) AWEIMConversationParticipantDataController *participantDataController; // @synthesize participantDataController=_participantDataController;
@property(retain, nonatomic) AWEIMUser *peerUser; // @synthesize peerUser=_peerUser;
@property(retain, nonatomic) NSString *peerUserID; // @synthesize peerUserID=_peerUserID;
@property(nonatomic) unsigned long long type; // @synthesize type=_type;
@property(retain, nonatomic) NSString *conversationID; // @synthesize conversationID=_conversationID;
@property(readonly, nonatomic) long long unreadCount;
@property(readonly, nonatomic) _Bool isCurrentGroupIsBanned;
@property(readonly, nonatomic) NSNumber *shortID;
- (void)participantsDataSourceDidUpdate;
- (void)p_fetchAllGroupParticipantInfo;
- (void)p_groupAddKVO;
- (void)p_singleAddKVO;
@property(readonly, nonatomic) NSString *peerSecUserID;
- (void)handleErrorResponse:(id)arg1 error:(id)arg2 completion:(CDUnknownBlockType)arg3;
- (void)leaveConversationWithCompletion:(CDUnknownBlockType)arg1;
- (void)deleteParticipantsWithIDs:(id)arg1 completion:(CDUnknownBlockType)arg2;
- (void)addParticipantsWithIDs:(id)arg1 toConversation:(id)arg2 completion:(CDUnknownBlockType)arg3;
- (void)updateNotice:(id)arg1 completion:(CDUnknownBlockType)arg2;
- (void)updateStickOnTop:(_Bool)arg1;
- (void)updateMuteStatus:(_Bool)arg1;
- (void)updateGroupChatName:(id)arg1 completion:(CDUnknownBlockType)arg2;
- (void)refreshPeerUserWithCompletion:(CDUnknownBlockType)arg1;
- (id)initWithConversationID:(id)arg1 options:(id)arg2;


@end

@protocol TIMOIMClientObserverDelegate <NSObject>

@optional
- (void)imClientIdentityTokenDidBecomeInvalid;
@end


@interface AWEIMLoginManager : NSObject <TIMOIMClientObserverDelegate>
{
    _Bool _reportedInvalidTokenError;
    _Bool _hasLoginSuccess;
    NSString *_token;
    NSMutableDictionary *_tokenRequestingStatus;
}

+ (AWEIMLoginManager *)sharedManager;
@property(nonatomic) _Bool hasLoginSuccess; // @synthesize hasLoginSuccess=_hasLoginSuccess;
@property(retain, nonatomic) NSMutableDictionary *tokenRequestingStatus; // @synthesize tokenRequestingStatus=_tokenRequestingStatus;
@property(copy, nonatomic) NSString *token; // @synthesize token=_token;
- (void)setRequestCountForUserID:(id)arg1 requestCount:(unsigned long long)arg2;
- (unsigned long long)requestCountForUserID:(id)arg1;
- (void)setRequestingTokenForUserID:(id)arg1 requesting:(_Bool)arg2;
- (_Bool)isRequestingTokenForUserID:(id)arg1;
- (id)tokenRequestContextForUserID:(id)arg1;
- (void)p_reportInvalidTokenError;
- (void)imClientIdentityTokenDidBecomeInvalid;
- (void)didFailToFetchToken;
- (void)sdk_reloginWithToken:(id)arg1 userID:(id)arg2;
- (void)sdk_loginWithToken:(id)arg1 userID:(id)arg2 secUserID:(id)arg3;
- (void)sdk_logout;
- (void)sdk_config;
- (void)manuallyKickOffPuller;
- (void)sendIMGetTokenMonitorDataSuccess:(_Bool)arg1 error:(id)arg2;
- (void)p_fetchLocalToken;
- (void)p_saveToken;
- (id)tokenKey;
- (void)p_getColdStartInterface:(unsigned long long)arg1;
- (_Bool)hasLogin;
- (void)logoutIMService;
- (void)loginIMService;
- (id)init;


@end


#endif /* AMEMessageHeaders_h */
