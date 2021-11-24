using System.Collections.Generic;
using DCL.Helpers;
using System.Linq;
using UnityEngine;

public static class AvatarAssetsTestHelpers
{
    public static WearableItemDummy CreateWearableItemDummy(string json)
    {
        return Newtonsoft.Json.JsonConvert.DeserializeObject<WearableItemDummy>(json);
    }

    public static void PrepareWearableItemDummy(WearableItemDummy wid)
    {
        wid.baseUrl = TestAssetsUtils.GetPath() + "/Avatar/Assets/";

        foreach (var rep in wid.data.representations)
        {
            rep.contents = rep.contents.Select((x) =>
                {
                    x.hash = x.key;
                    return x;
                })
                .ToArray();
        }

        wid.thumbnail = "";
    }

    public static BaseDictionary<string, WearableItem> CreateTestCatalogLocal()
    {
        List<WearableItemDummy> wearables = Object.Instantiate(Resources.Load<WearableItemDummyListVariable>("TestCatalogArrayLocalAssets")).list;

        foreach (var wearableItem in wearables)
        {
            PrepareWearableItemDummy( wearableItem );
        }

        CatalogController.wearableCatalog.Clear();
        var dummyWereables = wearables.Select(x => new KeyValuePair<string, WearableItem>(x.id, x)).ToArray();
        foreach (var item in dummyWereables)
        {
            CatalogController.wearableCatalog.Add(item.Key, item.Value);
            CatalogController.AddWearableUsage(item.Key);
        }

        return CatalogController.wearableCatalog;
    }
}