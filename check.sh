# Danh sách namespace


NAMESPACES=(application-3208 application-3209 application-3213 application-3215 application-4225 application-6259 application-6262)

for NS in "${NAMESPACES[@]}"; do
    if kubectl get sts elasticsearch-standalone-es-default -n "$NS" &> /dev/null; then
        echo "Rollout sts ES trong namespace: $NS"
        kubectl scale statefulset elasticsearch-standalone-es-default -n "$NS" --replicas=1
    else
        echo "❌ Không tìm thấy, bỏ qua."
    fi
done

echo "🏁 Hoàn tất cập nhật replicas."