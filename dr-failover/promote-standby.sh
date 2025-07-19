#!/bin/bash
CONTEXT=standby-eks
NAMESPACE=sock-shop
echo "⚙️ Switching to standby region ($CONTEXT)..."
kubectl --context=$CONTEXT scale deployment frontend --replicas=2 -n $NAMESPACE
kubectl --context=$CONTEXT scale deployment backend --replicas=2 -n $NAMESPACE
echo "✅ Standby region promoted. Services should now be live."