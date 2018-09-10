//
//  BinaryTreeNode.swift
//  LeetCode
//
//  Created by 叮咚钱包富银 on 2018/6/11.
//  Copyright © 2018年 leo. All rights reserved.
//

import Cocoa


//什么是二叉树？
//在计算机科学中，二叉树是每个节点最多有两个子树的树结构。通常子树被称作“左子树”和“右子树”，左子树和右子树同时也是二叉树。二叉树的子树有左右之分，并且次序不能任意颠倒。二叉树是递归定义的，所以一般二叉树的相关题目也都可以使用递归的思想来解决，当然也有一些可以使用非递归的思想解决，我下面列出的一些算法有些采用了递归，有些是非递归的。
//
//什么是二叉排序树？
//二叉排序树又叫二叉查找树或者二叉搜索树，它首先是一个二叉树，而且必须满足下面的条件：
//
//1）若左子树不空，则左子树上所有结点的值均小于它的根节点的值；
//
//2）若右子树不空，则右子树上所有结点的值均大于它的根结点的值
//
//3）左、右子树也分别为二叉排序树
//
//4）没有键值相等的节点（？可能是因为不好处理键值相等的节点到底是左节点还是右节点吧）
//


//二叉树节点定义
//采用单项链表的形式，只从根节点指向孩子节点，不保存父节点。

class BinaryTreeNode: NSObject {
    
    public var value: Int
    public var left: BinaryTreeNode?
    public var right: BinaryTreeNode?
    init(_ value : Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

//创建二叉排序树
//二叉树中左右节点值本身没有大小之分，所以如果要创建二叉树，就需要考虑如何处理某个节点是左节点还是右节点，如何终止某个子树而切换到另一个子树。 因此我选择了二叉排序树，二叉排序树中对于左右节点有明确的要求，程序可以自动根据键值大小自动选择是左节点还是右节点。



/**
 *  创建二叉排序树
 *  二叉排序树：左节点值全部小于根节点值，右节点值全部大于根节点值
 *
 *  @param values 数组
 *
 *  @return 二叉树根节点
 */
func createTreeWithValues(_ values: [Int]) -> BinaryTreeNode? {
    
    var root: BinaryTreeNode?
    
    for item in values {
        root = addTreeNode(root, item)
    }

    return root
    
}


/**
 *  向二叉排序树节点添加一个节点
 *
 *  @param treeNode 根节点
 *  @param value    值
 *
 *  @return 根节点
 */
func addTreeNode(_ treeNode: BinaryTreeNode?, _ value: Int) -> BinaryTreeNode {
    
    guard let treeNode = treeNode else {
        let node = BinaryTreeNode(value);
        return node
    }
    //值小于根节点，则插入到左子树
    if value < treeNode.value {
        treeNode.left = addTreeNode(treeNode.left, value)
    } else {
        //值大于根节点，则插入到右子树
        treeNode.right = addTreeNode(treeNode.right, value)
    }
    
    return treeNode
}

/**
 *  二叉树中某个位置的节点（按层次遍历）
 *
 *  @param index    按层次遍历树时的位置(从0开始算)
 *  @param rootNode 树根节点
 *
 *  @return 节点
 */
func treeNodeAtIndex(_ index: Int, inTree rootNode: BinaryTreeNode?) -> BinaryTreeNode? {
    
    guard let rootNode = rootNode else {
        return nil
    }
    
    guard index >= 0 else {
        return nil
    }
    
    //数组当成队列
    var nodeArr: [BinaryTreeNode] = []
    //压入根节点
    nodeArr.append(rootNode)
    
    var tempIndex = index
    
    while nodeArr.count > 0 {
        let node : BinaryTreeNode = nodeArr.first!
        if (tempIndex == 0) {
            return node
        }
        
         //弹出最前面的节点，仿照队列先进先出原则
        nodeArr.removeFirst()
        tempIndex = tempIndex - 1
        
        if node.left != nil {
            nodeArr.append(node.left!) //压入左节点
        }
        
        if node.right != nil {
            nodeArr.append(node.right!)//压入右节点
        }
    }
    
    //层次遍历完，仍然没有找到位置，返回nil
    return nil
}

/**
 *  先序遍历
 *  先访问根，再遍历左子树，再遍历右子树
 *
 *  @param rootNode 根节点
 *  @param handler  访问节点处理函数
 */
func  preOrderTraverseTree(_ rootNode: BinaryTreeNode?, handler: (BinaryTreeNode?) -> Void) -> Void {

    guard let rootNode = rootNode else {
        return
    }
    
    handler(rootNode)
    
    preOrderTraverseTree(rootNode.left, handler: handler)
    
    preOrderTraverseTree(rootNode.right, handler: handler)
}


/**
 *  中序遍历
 *  先遍历左子树，再访问根，再遍历右子树
 *
 *  @param rootNode 根节点
 *  @param handler  访问节点处理函数
 */
func inOrderTraverseTree(_ rootNode: BinaryTreeNode?, handler: (BinaryTreeNode?) -> Void) -> Void {

    guard let rootNode = rootNode else {
        return
    }
    
    inOrderTraverseTree(rootNode.left, handler: handler)
    
    handler(rootNode)
    
    inOrderTraverseTree(rootNode.right, handler: handler)
}


/**
 *  后序遍历
 *  先遍历左子树，再遍历右子树，再访问根
 *
 *  @param rootNode 根节点
 *  @param handler  访问节点处理函数
 */
func postOrderTraverseTree(_ rootNode: BinaryTreeNode?, handler: (BinaryTreeNode?) -> Void) -> Void {
    guard let rootNode = rootNode else {
        return
    }
    postOrderTraverseTree(rootNode.left, handler: handler)
    postOrderTraverseTree(rootNode.right, handler: handler)
    handler(rootNode)
}


//层次遍历
//按照从上到下、从左到右的次序进行遍历。先遍历完一层，再遍历下一层，因此又叫广度优先遍历。需要用到队列，在OC里可以用可变数组来实现。

/**
 *  层次遍历（广度优先）
 *
 *  @param rootNode 二叉树根节点
 *  @param handler  访问节点处理函数
 */
func levelTraverseTree(_ rootNode: BinaryTreeNode?, handler: (BinaryTreeNode?) -> Void) -> Void {
    guard let rootNode = rootNode else {
        return
    }
    
    //数组当成队列
    var nodeArr: [BinaryTreeNode] = []
    //压入根节点
    nodeArr.append(rootNode)
    
    while nodeArr.count > 0 {
        let node: BinaryTreeNode = nodeArr.first!
        
        handler(node)
        
        nodeArr.removeFirst()
        
        if node.left != nil {
            nodeArr.append(node.left!)

        }
        
        if node.right != nil {
            nodeArr.append(node.right!)
        }
    }
}


//二叉树的深度
//二叉树的深度定义为：从根节点到叶子结点依次经过的结点形成树的一条路径,最长路径的长度为树的深度。
//
//1）如果根节点为空，则深度为0；
//
//2）如果左右节点都是空，则深度为1；
//
//3）递归思想：二叉树的深度=max（左子树的深度，右子树的深度）+ 1

func depthOfTree(_ rootNode: BinaryTreeNode?) -> Int {
    
    guard let rootNode = rootNode else {
        return 0
    }
    
    if (rootNode.left == nil) && (rootNode.right == nil) {
        return 1
    }
    
    let leftDepth: Int = depthOfTree(rootNode.left)
    let rightDepth: Int = depthOfTree(rootNode.right)
    
    return max(leftDepth, rightDepth) + 1
}

//二叉树的宽度
//二叉树的宽度定义为各层节点数的最大值。

func widthOfTree(_ rootNode: BinaryTreeNode?) -> Int {
    
    guard let rootNode = rootNode else {
        return 0
    }
    
    
    //数组当成队列
    var nodeArr: [BinaryTreeNode] = []
    //压入根节点
    nodeArr.append(rootNode)
    
    var maxWidth = 1; //初始化最大宽度为1，因为有根节点
    var currentWidth = 0 //当前层的宽度，默认为0
    
    while nodeArr.count > 0 {
        
        currentWidth = nodeArr.count
        
        for _ in 0..<currentWidth {
            let node: BinaryTreeNode = nodeArr.first!
            //删除队列第一个
            nodeArr.removeFirst()
            
            if (node.left != nil) {
                nodeArr.append(node.left!)
            }
            
            if node.right != nil {
                nodeArr.append(node.right!)
            }
        }
        
       maxWidth =  max(maxWidth, nodeArr.count)
    }

    return maxWidth
}


//二叉树的所有节点数
//递归思想：二叉树所有节点数=左子树节点数+右子树节点数+1

/**
 *  二叉树的所有节点数
 *
 *  @param rootNode 根节点
 *
 *  @return 所有节点数
 *  return 层中的节点数
 */

func numberOfNodesInTree(_ rootNode: BinaryTreeNode?) -> Int {
   
    //方法1
    /*
    guard let rootNode = rootNode else {
        return 0
    }
    
    //数组当成队列
    var nodeArr: [BinaryTreeNode] = []
    //压入根节点
    nodeArr.append(rootNode)
    
    var number = 1; //初始化最大宽度为1，因为有根节点
    
    
    while nodeArr.count > 0 {
        
        let node: BinaryTreeNode = nodeArr.first!
        //删除队列第一个
        nodeArr.removeFirst()
        
        if (node.left != nil) {
            number = number + 1
            nodeArr.append(node.left!)
        }
        
        if node.right != nil {
            number = number + 1
            nodeArr.append(node.right!)
        }
    }
    
    return number
 */
    
    //方法2 递归
    guard let rootNode = rootNode else {
        return 0
    }
    
    return numberOfNodesInTree(rootNode.left) + numberOfNodesInTree(rootNode.right) + 1
}


//二叉树某层中的节点数
//1）根节点为空，则节点数为0；
//
//2）层为1，则节点数为1（即根节点）
//
//3）递归思想：二叉树第k层节点数=左子树第k-1层节点数+右子树第k-1层节点数

/**
 *  二叉树某层中的节点数
 *
 *  @param level    层
 *  @param rootNode 根节点
 *
 *  @return 层中的节点数
 */
func numberOfNodesOnLevel(_ level: Int, _ rootNode: BinaryTreeNode?) -> Int {
    
    guard let rootNode = rootNode, level >= 1 else { //根节点不存在或者level<0
        return 0
    }
    
    if level == 1 { //level=1，返回1（根节点）
        return 1
    }
    //递归：level层节点数 = 左子树level-1层节点数+右子树level-1层节点数
    return numberOfNodesOnLevel(level - 1, rootNode.left) + numberOfNodesOnLevel(level - 1, rootNode.right)
}

//二叉树叶子节点数
//叶子节点，又叫终端节点，是左右子树都是空的节点。

/**
 *  二叉树叶子节点数
 *
 *  @param rootNode 根节点
 *
 *  @return 叶子节点数
 */
func numberOfLeafsInTree(_ rootNode: BinaryTreeNode?) -> Int {
    guard let rootNode = rootNode else {
        return 0
    }
    //左子树和右子树都是空，说明是叶子节点
    if rootNode.left == nil && rootNode.right == nil {
        return 1
    }
    //递归：叶子数 = 左子树叶子数 + 右子树叶子数
    return numberOfLeafsInTree(rootNode.left) + numberOfLeafsInTree(rootNode.right)
}

//二叉树最大距离（二叉树的直径）
//二叉树中任意两个节点都有且仅有一条路径，这个路径的长度叫这两个节点的距离。二叉树中所有节点之间的距离的最大值就是二叉树的直径。
//
//有一种解法，把这个最大距离划分了3种情况：
//
//1）这2个节点分别在根节点的左子树和右子树上，他们之间的路径肯定经过根节点（他们到根节点的距离=左 + 右子树的深度）。
//
//2）这2个节点都在左子树上
//
//3）这2个节点都在右子树上
//
//综上，只要取这3种情况中的最大值，就是二叉树的直径。

func maxDistanceOfTree(_ rootNode: BinaryTreeNode?) -> Int {
    
    guard let rootNode = rootNode else {
        return 0
    }
    
    //    方案一：（递归次数较多，效率较低）
    //分3种情况：
    //1、最远距离经过根节点：距离 = 左子树深度 + 右子树深度
    let distance = depthOfTree(rootNode.left) + depthOfTree(rootNode.right)
    
    //2、最远距离在根节点左子树上，即计算左子树最远距离
    let disLeft = maxDistanceOfTree(rootNode.left)
    
    //3、最远距离在根节点右子树上，即计算右子树最远距离
    let disRight = maxDistanceOfTree(rootNode.right)
    
    return max(distance, max(disLeft, disRight))
}

//方式2
//新定义类，集成BinaryTreeNode，增加两个属性，深度和最远距离
class TreeNodeProperty: BinaryTreeNode {
    public var depth: Int?
    public var distance: Int?
    
    public override init(_ value: Int) {
        super.init(value)
    }
}

func maxDistanceOfTreeMethod2(_ rootNode: BinaryTreeNode?) -> Int {
    guard let rootNode = rootNode else {
        return 0
    }
    
    let p: TreeNodeProperty? = propertyOfTreeNode(rootNode)
    
    guard  p != nil else {
        return 0
    }
    
    return p?.distance ?? 0
}

func propertyOfTreeNode(_ rootNode: BinaryTreeNode?) -> TreeNodeProperty? {
    guard let rootNode = rootNode else {
        return nil
    }
    
    let left: TreeNodeProperty? = propertyOfTreeNode(rootNode.left)
    
    let right: TreeNodeProperty? = propertyOfTreeNode(rootNode.right)

    let p: TreeNodeProperty = TreeNodeProperty(0)
    
    p.depth = max((left?.depth) ?? 0, right?.depth ?? 0) + 1
    
    let maxDis: Int = max(left?.distance ?? 0, right?.distance ?? 0)
    let maxDep: Int = max(left?.depth ?? 0, right?.depth ?? 0)
    
    p.distance = max(maxDis, maxDep)
    
    return p
}


//二叉树中某个节点到根节点的路径
//既是寻路问题，又是查找节点问题。
//
//定义一个存放路径的栈（不是队列了，但是还是用可变数组来实现的）
//
//1）压入根节点，再从左子树中查找（递归进行的），如果未找到，再从右子树中查找，如果也未找到，则弹出根节点，再遍历栈中上一个节点。
//
//2）如果找到，则栈中存放的节点就是路径所经过的节点。


/**
 *  二叉树中某个节点到根节点的路径
 *
 *  @param treeNode 节点
 *  @param rootNode 根节点
 *
 *  @return 存放路径节点的数组
 */
func pathOfTreeNode(_ treeNode: BinaryTreeNode?, _ rootNode: BinaryTreeNode?) -> [BinaryTreeNode] {
    
    var pathArr: [BinaryTreeNode] = []
    
    _ = isFoundTreeNode(treeNode, rootNode, &pathArr)
    
    return pathArr
}

/**
 *  查找某个节点是否在树中
 *
 *  @param treeNode 待查找的节点
 *  @param rootNode 根节点
 *  @param path  根节点到待查找节点的路径
 *
 *  @return YES：找到，NO：未找到
 */
func isFoundTreeNode(_ treeNode: BinaryTreeNode?, _ rootNode: BinaryTreeNode?, _  pathArr: inout [BinaryTreeNode]) -> Bool {
    
    guard let treeNode = treeNode, let rootNode = rootNode  else {
        return false
    }
    
    //找到节点
    if rootNode == treeNode {
        return true
    }
    
    //压入根节点，进行递归
    pathArr.append(rootNode)
    
    //先从左子树开始查找
    var find: Bool = isFoundTreeNode(treeNode, rootNode.left, &pathArr)
    
    //未找到,再从右子树查找
    if !find {
        find = isFoundTreeNode(treeNode, rootNode.right, &pathArr)
    }
    
    //若两边都没找到，则pop此根节点
    
    if !find {
        pathArr.removeLast()
    }
    
    return find
}

//二叉树中两个节点最近的公共父节点
//首先需要明白，根节点肯定是二叉树中任意两个节点的公共父节点（不一定是最近的），因此二叉树中2个节点的最近公共父节点一定在从根节点到这个节点的路径上。因此我们可以先分别找到从根节点到这2个节点的路径，再从这两个路径中找到最近的公共父节点。
/**
 *  二叉树中两个节点最近的公共父节点
 *
 *  @param nodeA    第一个节点
 *  @param nodeB    第二个节点
 *  @param rootNode 二叉树根节点
 *
 *  @return 最近的公共父节点
 */
func parentOfNode(_ nodeA: BinaryTreeNode?, _ nodeB: BinaryTreeNode?, _ rootNode: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let nodeA = nodeA, let nodeB = nodeB, let rootNode = rootNode  else {
        return nil
    }
    
    if nodeA == nodeB {
        return nodeA
    }
    
    //从根节点到A的路径
    let pathA: [BinaryTreeNode] = pathOfTreeNode(nodeA, rootNode)
    //从根节点到B的路径
    let pathB: [BinaryTreeNode] = pathOfTreeNode(nodeB, rootNode)

    //从后往前推，查找第一个出现的公共节点
    for i in (0..<pathA.count).reversed() {
        for j in (0..<pathB.count).reversed() {
            if pathA[i] == pathB[j] {
                return pathA[i]
            }
        }
    }
    
    return nil
}

//二叉树两个节点之间的距离
//可以从两个节点之间的路径衍生出来。
func distanceFromNode(_ nodeA: BinaryTreeNode?, _ nodeB: BinaryTreeNode?, _ rootNode: BinaryTreeNode?) -> Int {
    guard let nodeA = nodeA, let nodeB = nodeB, let rootNode = rootNode  else {
        return 0
    }
    
    if nodeA == nodeB {
        return 0
    }
    
    //从根节点到A的路径
    let pathA: [BinaryTreeNode] = pathOfTreeNode(nodeA, rootNode)
    //从根节点到B的路径
    let pathB: [BinaryTreeNode] = pathOfTreeNode(nodeB, rootNode)
    
    //其中一个节点不在树中，则没有路径
    if (pathA.count == 0 || pathB.count == 0) {
        return -1;
    }
    
    //从后往前推，查找第一个出现的公共节点
    for i in (0..<pathA.count).reversed() {
        //找到公共父节点
        for j in (0..<pathB.count).reversed() {
            //距离=路径节点数-1 （这里要-2，因为公共父节点重复了一次）
            if pathA[i] == pathB[j] {
                return pathA.count - i + pathB.count - j - 2
            }
        }
    }
    
    return 0
}

///怎么判断是二叉查找树
//左子树的值都小于当前节点的值，右子树节点的值都大于当前节点的值
func isValidBST(_ rootNode: BinaryTreeNode?) -> Bool {
    return _helper(node: rootNode, nil, nil);
}

func _helper(node:BinaryTreeNode?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else {
        return true;
    }
    //所有右子树节点的值都必须大于根节点的值
    if let min = min, node.value <= min {
        return false;
    }
    
    //所有左子树的值都必须小于根节点
    if let max = max, node.value >= max {
        return false
    }
    return _helper(node: node.left, min, node.value) && _helper(node: node.right, node.value, max);
}


//翻转二叉树
//你会翻转二叉树吗？如果不会，那对不起，我们不会录用你！
//
//翻转二叉树，又叫求二叉树的镜像，就是把二叉树的左右子树对调（当然是递归的）

/**
 *  翻转二叉树（又叫：二叉树的镜像）
 *
 *  @param rootNode 根节点
 *
 *  @return 翻转后的树根节点（其实就是原二叉树的根节点）
 */
func invertBinaryTree(_ rootNode: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let rootNode = rootNode else {
        return nil
    }
    
    if rootNode.left == nil && rootNode.right == nil {
        return rootNode
    }
    
    _ = invertBinaryTree(rootNode.left)
    _ = invertBinaryTree(rootNode.right)
    
    let temp: BinaryTreeNode? = rootNode.left
    rootNode.left = rootNode.right
    rootNode.right = temp

    return rootNode
}

//判断二叉树是否完全二叉树
//完全二叉树定义为：若设二叉树的高度为h，除第h层外，其它各层的结点数都达到最大个数，第h层有叶子结点，并且叶子结点都是从左到右依次排布。
//
//完全二叉树必须满足2个条件：
//
//1）如果某个节点的右子树不为空，则它的左子树必须不为空
//
//2）如果某个节点的右子树为空，则排在它后面的节点必须没有孩子节点
//
//这里还需要理解“排在它后面的节点”，回头看看层次遍历算法，我们就能知道在层次遍历时，是从上到下从左到右遍历的，先将根节点弹出队列，再压入孩子节点，因此“排在它后面的节点”有2种情况：
//
//1）同层次的后面的节点
//
//2）同层次的前面的节点的孩子节点（因为遍历前面的节点时，会弹出节点，同时将孩子节点压入队列）
//
//通过上面的分析，我们可以设置一个标志位flag，当子树满足完全二叉树时，设置flag=YES。当flag=YES而节点又破坏了完全二叉树的条件，那么它就不是完全二叉树。

/**
 *  是否完全二叉树
 *  完全二叉树：若设二叉树的高度为h，除第h层外，其它各层的结点数都达到最大个数，第h层有叶子结点，并且叶子结点都是从左到右依次排布
 *
 *  @param rootNode 根节点
 *
 *  @return YES：是完全二叉树，NO：不是完全二叉树
 */
func isCompleteBinaryTree(_ rootNode: BinaryTreeNode?) -> Bool {
    guard let rootNode = rootNode else {
        return false
    }
    //左子树和右子树都是空，则是完全二叉树
    if rootNode.left == nil && rootNode.right == nil {
        return true
    }
    
    //左子树是空，右子树不是空，则不是完全二叉树
    if rootNode.left == nil && rootNode.right != nil {
        return false
    }
    
    
    //按层次遍历节点，找到满足完全二叉树的条件：
    //条件1：如果某个节点的右子树不为空，则它的左子树必须不为空
    //条件2：如果某个节点的右子树为空，则排在它后面的节点必须没有孩子节点
    //排在该节点后面的节点有2种：1）同层次的后面的节点 2）同层次的前面的节点的孩子节点（因为遍历前面的节点的时候，会将节点从队列里pop，同时把它的孩子节点push到队列里）
    
    var fifo: [BinaryTreeNode] = []
    //将根节点加入队列
    fifo.append(rootNode)
    
    var isComplete: Bool = false //标志是否满足完全二叉树
    
    while fifo.count > 0 {
        let node: BinaryTreeNode = fifo.first!
        fifo .removeFirst()
        
        //左子树为空且右子树不为空，则不是
        if node.left == nil && node.right != nil {
            return false
        }
        
        //前面的节点已满足完全二叉树,如果还有孩子节点，则不是完全二叉树
        if isComplete == true && (node.left != nil || node.right != nil) {
            return false
        }
        
        //右子树为空，则已经满足完全二叉树
        if node.right == nil {
            isComplete = true
        }
        
        //加入队列
        if node.left != nil {
            fifo.append(node.left!)
        }
        
        if node.right != nil {
            fifo.append(node.right!)
        }
    }
    
    return isComplete
}

//判断二叉树是否满二叉树
//满二叉树定义为：除了叶结点外每一个结点都有左右子叶且叶子结点都处在最底层的二叉树
//
//满二叉树的一个特性是：叶子数=2^(深度-1)，因此我们可以根据这个特性来判断二叉树是否是满二叉树。
//             或者 总节点数 = 2^(深度） -1

/**
 *  是否满二叉树
 *  满二叉树：除了叶结点外每一个结点都有左右子叶且叶子结点都处在最底层的二叉树
 *
 *  @param rootNode 根节点
 *
 *  @return YES：满二叉树，NO：非满二叉树
 */
func isFullBinaryTree(_ rootNode: BinaryTreeNode?) -> Bool {
    guard let rootNode = rootNode else {
        return false
    }
    
    //求出深度
    let depath: Int = depthOfTree(rootNode)
//    求出节点数
    let number: Int = numberOfNodesInTree(rootNode)
    
    //满二叉树特性； 节点数 = 2 ^ (深度) - 1
    let res: Decimal = pow(2, depath)
    
    if number == (res.exponent  - 1) {
        return true
    }
    return false
}

//判断二叉树是否平衡二叉树
//平衡二叉树定义为：它是一棵空树或它的左右两个子树的高度差的绝对值不超过1，并且左右两个子树都是一棵平衡二叉树。平衡二叉树又叫AVL树。
func isAVLBinaryTree(_ rootNode: BinaryTreeNode?) -> Bool {
    struct Temp {
        static var height: Int = 0
    }
    
    guard let rootNode = rootNode else {
        Temp.height = 0
        return true
    }
    
    if rootNode.left == nil && rootNode.right == nil {
        Temp.height = 1
        return true
    }
    
    let isLeft: Bool = isAVLBinaryTree(rootNode.left)
    let heightLeft = Temp.height
    
    let isRight: Bool = isAVLBinaryTree(rootNode.right)
    let heightRight = Temp.height
    
    
    if isLeft && isRight && abs(heightLeft-heightRight) <= 1 {
        return true
    }
    
    return false
}
