using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Runtime.Caching;

namespace ManajemenLaundrySepatu
{
    public static class Cache
    {
        private static MemoryCache _cache = MemoryCache.Default;
        private static Dictionary<string, DateTime> _lastUpdateDict = new Dictionary<string, DateTime>();
        private static Dictionary<string, int> _ttlDict = new Dictionary<string, int>();
        private static Dictionary<string, DateTime> _cacheSetTimeDict = new Dictionary<string, DateTime>();

        public static void SetCache(string key, object value, int seconds = 60)
        {
            _cache.Set(key, value, DateTimeOffset.Now.AddSeconds(seconds));
            _lastUpdateDict[key] = DateTime.Now;
            _ttlDict[key] = seconds;
            _cacheSetTimeDict[key] = DateTime.Now;
        }

        public static object GetCache(string key)
        {
            return _cache.Get(key);
        }

        public static void RemoveCache(string key)
        {
            _cache.Remove(key);
            _lastUpdateDict.Remove(key);
            _ttlDict.Remove(key);
        }

        public static bool HasCache(string key)
        {
            return _cache.Contains(key);
        }

        public static DateTime GetLastUpdate(string key)
        {
            if (_lastUpdateDict.TryGetValue(key, out DateTime lastUpdate))
                return lastUpdate;
            return DateTime.MinValue;
        }

        public static int? GetTTL(string key)
        {
            if (_ttlDict.TryGetValue(key, out int ttl))
                return ttl;
            return null;
        }

        public static string GetTTLCountdown(string key)
        {
            if (!_ttlDict.ContainsKey(key) || !_cacheSetTimeDict.ContainsKey(key))
                return "TTL tidak diketahui";

            int ttl = _ttlDict[key];
            DateTime setTime = _cacheSetTimeDict[key];
            double elapsed = (DateTime.Now - setTime).TotalSeconds;
            double remaining = ttl - elapsed;

            if (remaining <= 0)
                return "Expired";

            TimeSpan ts = TimeSpan.FromSeconds(remaining);
            return $"{(int)ts.TotalMinutes:D2}:{ts.Seconds:D2}";
        }

        public static long GetApproximateSize(object obj)
        {
            try
            {
                using (var stream = new System.IO.MemoryStream())
                {
                    var formatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                    formatter.Serialize(stream, obj);
                    return stream.Length;
                }
            }
            catch
            {
                return -1;
            }
        }

        public static string GetCachePreview(string key)
        {
            if (!HasCache(key))
                return "❌ Cache tidak ditemukan~";

            var data = GetCache(key);
            string info = "";

            if (data is DataTable dt)
                info += $"🗂 Total Data \t\t: {dt.Rows.Count} baris\n";

            if (data is IDictionary dictionary)
                info += $"🔑 Total Data \t\t: {dictionary.Count} item\n";

            var lastUpdate = GetLastUpdate(key);
            info += $"🕓 Last Update \t\t: {lastUpdate:yyyy-MM-dd HH:mm:ss}\n";

            var ttlCountdown = GetTTLCountdown(key);
            info += $"⏳ TTL Countdown \t: {ttlCountdown}\n";

            long size = GetApproximateSize(data);
            info += $"📦 Size \t\t\t: {(size >= 0 ? $"{size / 1024.0:F2} KB" : "N/A")}";

            return info;
        }

        public static void ClearCache(string key)
        {
            RemoveCache(key);
        }
    }
}