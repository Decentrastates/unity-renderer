﻿using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class PublicChannelEntry : BaseComponentView, IComponentModelConfig
{
    [SerializeField] private Button openChatButton;
    [SerializeField] private TMP_Text nameLabel;
    [SerializeField] private PublicChannelEntryModel model;
    [SerializeField] private UnreadNotificationBadge unreadNotifications;
    
    private IChatController chatController;
    private ILastReadMessagesService lastReadMessagesService;

    public PublicChannelEntryModel Model => model;

    public event Action<PublicChannelEntry> OnOpenChat;

    public override void Awake()
    {
        base.Awake();
        openChatButton.onClick.AddListener(() => OnOpenChat?.Invoke(this));
    }

    public void Initialize(IChatController chatController,
        ILastReadMessagesService lastReadMessagesService)
    {
        this.chatController = chatController;
        this.lastReadMessagesService = lastReadMessagesService;
    }

    public void Configure(BaseComponentModel newModel)
    {
        model = (PublicChannelEntryModel) newModel;
        RefreshControl();
    }

    public override void RefreshControl()
    {
        nameLabel.text = $"#{model.name}";
        unreadNotifications.Initialize(chatController, model.channelId, lastReadMessagesService);
    }

    [Serializable]
    public class PublicChannelEntryModel : BaseComponentModel
    {
        public string channelId;
        public string name;

        public PublicChannelEntryModel(string channelId, string name)
        {
            this.channelId = channelId;
            this.name = name;
        }
    }
}